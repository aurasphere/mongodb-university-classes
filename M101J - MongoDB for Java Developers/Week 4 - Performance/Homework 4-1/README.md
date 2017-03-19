# Problem
Suppose you have a collection with the following indexes:

    > db.products.getIndexes()
    [
        {
            "v" : 1,
            "key" : {
                "_id" : 1
            },
            "ns" : "store.products",
            "name" : "_id_"
        },
        {
            "v" : 1,
            "key" : {
                "sku" : 1
            },
                    "unique" : true,
            "ns" : "store.products",
            "name" : "sku_1"
        },
        {
            "v" : 1,
            "key" : {
                "price" : -1
            },
            "ns" : "store.products",
            "name" : "price_-1"
        },
        {
            "v" : 1,
            "key" : {
                "description" : 1
            },
            "ns" : "store.products",
            "name" : "description_1"
        },
        {
            "v" : 1,
            "key" : {
                "category" : 1,
                "brand" : 1
            },
            "ns" : "store.products",
            "name" : "category_1_brand_1"
        },
        {
            "v" : 1,
            "key" : {
                "reviews.author" : 1
            },
            "ns" : "store.products",
            "name" : "reviews.author_1"
        }
    ]
	
Which of the following queries can utilize at least one index to find all matching documents, or to sort? Check all that apply.

Note: the text for some answers may wrap; you can ignore the wrapping.

Check all that apply:
 - db.products.find( { 'brand' : "GE" } )
 - db.products.find( { 'brand' : "GE" } ).sort( { price : 1 } )
 - db.products.find( { $and : [ { price : { $gt : 30 } }, { price : { $lt : 50 } } ] } ).sort( { brand : 1 } )
 - db.products.find( { brand : 'GE' } ).sort( { category : 1, brand : -1 } )

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>db.products.find( { 'brand' : "GE" } ).sort( { price : 1 } )</li>
      <li>db.products.find( { $and : [ { price : { $gt : 30 } }, { price : { $lt : 50 } } ] } ).sort( { brand : 1 } )</li>
    </ul>
</details>