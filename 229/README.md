# Useful priming

```
Create unit tests that should currently fail (because there is not actual implementation). But, that is up to out expectations of what should happen
```

```
@obito-backend/ @docker-publish.yml 
We need to create different images for this application, depending if the push is on `main`, `feat/*` branches or `staging`.

Because we have to push different images to @obito-backend/ @base/ @overlays/  and these should have different http endpoints available, exposing them:

- obitos.funerariafrancana.com.br (production)
- dev.obitos.funerariafrancana.com.br (features-testing branches)
- staging.obitos.funerariafrancana.com.br (stable features testing branch)

ArgoCD applicationset should automatically pick up on these new images, and update different applications (app-production/app-development/app-staging)

Help me set up both ends.

Website does this, to a certain extend @website/ @docker-publish.yml @.github-workflows-template-argocd-sync.yml @workflows/ 

Although, it says:
" Back-off pulling image "ghcr.io/assistencia-familiar-francana/website:dev": ErrImagePull: rpc error: code = NotFound desc = failed to pull and unpack image "ghcr.io/assistencia-familiar-francana/website:dev": failed to resolve reference "ghcr.io/assistencia-familiar-francana/website:dev": ghcr.io/assistencia-familiar-francana/website:dev: not found"

On `website-development` on argo. Ideally it should be picking up `dev-{sha}` images and updating them. Conversely, gitworkflow should produce these.
```
