# Problem
Supposed we executed the following Java code. How many animals will be inserted into the "animals" collection?

    import com.mongodb.MongoClient;
    import com.mongodb.client.MongoCollection;
    import com.mongodb.client.MongoDatabase;
    import org.bson.Document;
    
    public class InsertTest {
            public static void main(String[] args) {
                MongoClient c =  new MongoClient();
                MongoDatabase db = c.getDatabase("test");
                MongoCollection<Document> animals = db.getCollection("animals");
    
               Document animal = new Document("animal", "monkey");
    
                animals.insertOne(animal);
                animal.remove("animal");
                animal.append("animal", "cat");
                animals.insertOne(animal);
                animal.remove("animal");
                animal.append("animal", "lion");
                animals.insertOne(animal);
            }
    }
	
Choose the best answer:
 - 0
 - 1
 - 2
 - 3

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>1</li>
	</ul>
</details>