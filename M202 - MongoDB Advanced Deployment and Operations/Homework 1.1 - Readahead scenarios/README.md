# Problem
Initially, your system has the following properties:

 - You're working with a system where your indexes and part of your working set fit in memory
 - You're not constrained by write locks
 - You are using an SSD
 - Documents are typically sorted on one of several fields and order does not correspond to natural order, though often adjacent docs will be requested in the same query
 - You then change your system in the following ways, one at a time, before returning to your original state.

During which of the following changes should a higher readahead result in a larger performance increase than it would have for the initial system state?

Assume that any property of the system not mentioned in a particular choice is still in the state listed above.

Check all that apply:

 - You begin frequently accessing your data from capped collections, in the order in which it was written.
 - You are now using a spinning disk, rather than an SSD.
 - You are now writing frequently, so that write locks become a constraint while reads have to wait.
 - Your working set outgrows the available memory, so you are having to go to storage much more often.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>You begin frequently accessing your data from capped collections, in the order in which it was written.</li>
	  <li>You are now using a spinning disk, rather than an SSD.</li>
	</ul>
</details>
