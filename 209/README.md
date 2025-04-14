# Elm tips

## Message Mapping

In a larger landing page application, you may have many “child” components. In this example, the landing page wraps all messages from the contact form into a ContactMsg constructor. This is an example of message lifting, which lets you reuse the same component while keeping your overall update loop manageable.

## State Delegation

The landing page holds a contact field in its model. It delegates updates for contact events by calling the update function from the Page.Contact module and then mapping the resulting commands back into its message space.


