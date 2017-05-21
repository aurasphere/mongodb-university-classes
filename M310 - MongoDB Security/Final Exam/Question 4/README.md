# Problem
Which of the following createRole parameters are valid when executed on the production database?

Check all that apply:
 - {
  role: "team-lead",
  privileges: [{
    resource: { replicaSet: true },
    actions: [ "createUser" ]
  }],
  roles:[{
    role: "root", db: "production"
  }]
}

 - {
  role: "senior-engineer",
  privileges: [],
  roles: [ "dbAdmin" ]
}
 - {
  role: "junior-engineer",
  privileges: [{
    resource: { db: "production" },
    actions: [ "insert" ]
  }],
  roles:[]
}

 - {
  role: "intern",
  privileges: [{
    resource: { db: "staging", collection: "products" },
    actions: [ "insert" ]
  }],
  roles:[]
}

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>{
  role: "senior-engineer",
  privileges: [],
  roles: [ "dbAdmin" ]
}</li>
 	</ul>
</details>