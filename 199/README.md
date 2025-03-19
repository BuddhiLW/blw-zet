# Full Cycle notes

## SQLC

### Transactions

To make calls transactional, which only commit changes when succeed, we create a `callTx` wrapper.

It will take a `context` and the actual function-action we want to apply, `fn`.

``` go
func (c *CourseDB) callTx(ctx context.Context, fn func(*db.Queries) error) error {
  tx, err := c.dbConn.BeginTx(ctx, nil) // ACID: Isolation level as the default
  if err != nil {
    return err
  }
  q := db.New(tx)
  err = fn(q)
  if err != nil {
      if errRb := tx.Rollback(); errrb != nil {
        return fmt.Errorf("error on rollback: %v", original error: %w", errRb, err)
      }
      return err
  }
  return tx.Commit()
}
```

```
flowchart TD
    A[Start] --> B[Begin Transaction: c.dbConn.BeginTx(ctx, nil)]
    B --> |Error| C[Return error]
    B --> |Success| D[Create query object: db.New(tx)]
    D --> E[Execute function: fn(q)]
    E --> |Error| F[Call tx.Rollback()]
    F --> G{Rollback error?}
    G -- Yes --> H[Return formatted rollback error]
    G -- No --> I[Return original error from fn]
    E --> |Success| J[Call tx.Commit()]
    J --> K[Return commit result]
```

Using `overarch`:

``` edn
#{
  ;; Nodes
  {:el :step
   :id :tx-wrapper/start
   :name "Start"}

  {:el :step
   :id :tx-wrapper/begin-tx
   :name "Begin Transaction: c.dbConn.BeginTx(ctx, nil)"}

  {:el :decision
   :id :tx-wrapper/tx-error?
   :name "Transaction Error?"}

  {:el :step
   :id :tx-wrapper/return-error
   :name "Return error"}

  {:el :step
   :id :tx-wrapper/create-query
   :name "Create query object: q = db.New(tx)"}

  {:el :step
   :id :tx-wrapper/execute-fn
   :name "Execute function: fn(q)"}

  {:el :decision
   :id :tx-wrapper/fn-error?
   :name "fn(q) Error?"}

  {:el :step
   :id :tx-wrapper/attempt-rollback
   :name "Attempt Rollback: tx.Rollback()"}

  {:el :decision
   :id :tx-wrapper/rollback-error?
   :name "Rollback Error?"}

  {:el :step
   :id :tx-wrapper/return-formatted-rollback-error
   :name "Return formatted rollback error"}

  {:el :step
   :id :tx-wrapper/return-original-error
   :name "Return original error from fn"}

  {:el :step
   :id :tx-wrapper/commit-tx
   :name "Commit Transaction: tx.Commit()"}

  {:el :step
   :id :tx-wrapper/return-commit
   :name "Return commit result"}

  ;; Relations
  {:el :rel
   :id :tx-wrapper/rel-start-to-begin
   :from :tx-wrapper/start
   :to :tx-wrapper/begin-tx}

  {:el :rel
   :id :tx-wrapper/rel-begin-to-tx-error
   :from :tx-wrapper/begin-tx
   :to :tx-wrapper/tx-error?}

  {:el :rel
   :id :tx-wrapper/rel-tx-error-yes
   :from :tx-wrapper/tx-error?
   :to :tx-wrapper/return-error
   :label "Yes"}

  {:el :rel
   :id :tx-wrapper/rel-tx-error-no
   :from :tx-wrapper/tx-error?
   :to :tx-wrapper/create-query
   :label "No"}

  {:el :rel
   :id :tx-wrapper/rel-create-to-execute
   :from :tx-wrapper/create-query
   :to :tx-wrapper/execute-fn}

  {:el :rel
   :id :tx-wrapper/rel-execute-to-fn-error
   :from :tx-wrapper/execute-fn
   :to :tx-wrapper/fn-error?
   :label "Result"}

  {:el :rel
   :id :tx-wrapper/rel-fn-error-yes
   :from :tx-wrapper/fn-error?
   :to :tx-wrapper/attempt-rollback
   :label "Yes"}

  {:el :rel
   :id :tx-wrapper/rel-fn-error-no
   :from :tx-wrapper/fn-error?
   :to :tx-wrapper/commit-tx
   :label "No"}

  {:el :rel
   :id :tx-wrapper/rel-attempt-to-rollback-error
   :from :tx-wrapper/attempt-rollback
   :to :tx-wrapper/rollback-error?}

  {:el :rel
   :id :tx-wrapper/rel-rollback-error-yes
   :from :tx-wrapper/rollback-error?
   :to :tx-wrapper/return-formatted-rollback-error
   :label "Yes"}

  {:el :rel
   :id :tx-wrapper/rel-rollback-error-no
   :from :tx-wrapper/rollback-error?
   :to :tx-wrapper/return-original-error
   :label "No"}

  {:el :rel
   :id :tx-wrapper/rel-commit-to-return
   :from :tx-wrapper/commit-tx
   :to :tx-wrapper/return-commit}
}
```
