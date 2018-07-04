# README

## Generating App

run
```
rails new app-name
```

This will generate the app.

---

## Generating Models and Migrations

You can then run
```
rails g resource [model name singular] column_name:type
```
for each model. MAKE SURE TO include any references for foreign keys for your associations/relationships
e.g.
```
rails g resource pet name species owner:references
```

This will generate a column for foreign key in your SQL table, and in the model build the relevant 'belongs to' association. *Make sure to build the corresponding has_many relationship*

Build the 7 http verbs in your controllers. Make sure to have 'destroy' instead of delete (index, show, new, create, edit, update, destroy). Also in the controller, build out your before action
```
  before_action :get_model, only: [:show, :edit, :update, :destroy]
```

Define your indices.

define your get_model under 'private' in your controller.

Then define strong_params under 'private' in your controller.

MIGRATE. Run Rake db:migrate. (Then maybe 'bin/rake db:migrate RAILS_ENV=development')

Start building views.

Build form_for as below:

```
<%= form_for @model_name do |f| %>
  <%= f.label :name  %>
  <%= f.text_field :name %>
  <%= f.submit %>

<% end %>
```
