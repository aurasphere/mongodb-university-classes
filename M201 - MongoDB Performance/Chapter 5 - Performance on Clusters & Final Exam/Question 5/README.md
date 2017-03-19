# Problem
Which of the following statements is/are true?

Check all that apply:
 - Compound indexes can service queries that filter on any subset of the index keys.
 - Compound indexes can service queries that filter on a prefix of the index keys.
 - If no indexes can be used then a collection scan will be necessary.
 - Query plans are evicted from the plan cache on index creation, destruction, or server restart.
 - By default, the explain() command will execute your query.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Compound indexes can service queries that filter on a prefix of the index keys.</li>
      <li>If no indexes can be used then a collection scan will be necessary.</li>
      <li>Query plans are evicted from the plan cache on index creation, destruction, or server restart.</li>
	</ul>
</details>