# Problem
How would you print out, in the shell, just the value in the "name" field, for all the product documents in the collection, without extraneous characters or braces, sorted alphabetically, ascending? (Check all that would apply.)
Check all that apply:

 - db.products.find( { }, { name : 1, _id : 0 } ).sort( { name : 1 } )
 - var c = db.products.find( { }, { name : 1, _id : 0 } ).sort( { name : 1 } );
   while( c.hasNext() ) {
       print( c.next().name);
   }
 - var c = db.products.find( { } ).sort( { name : 1 } );
   c.forEach( function( doc ) { print( doc.name ) } );
 - var c = db.products.find( { } ).sort( { name : -1 } );
   while( c.hasNext() ) {
       print( c.next().name);
   }

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>var c = db.products.find( { }, { name : 1, _id : 0 } ).sort( { name : 1 } );
   while( c.hasNext() ) {
       print( c.next().name);
   }</li>
	  <li>var c = db.products.find( { } ).sort( { name : 1 } );
   c.forEach( function( doc ) { print( doc.name ) } );</li>
	</ul>
</details>