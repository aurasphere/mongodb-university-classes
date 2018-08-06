### Chapter 1: Replica Set Transactions
# Lab: Error Handling

## Problem:

In this lab we will be exploring error handling related with transaction support.

As for handouts of this lab, you can find two files:

 - loader.py
 - data.json

## Handouts Description

loader.py is a script that does the following set of steps:

 - connects to a MongoDB replica set (by default running on this course m040 VM).
 
       mongodb://m040:27017/m040?replicaSet=M040

 - Drops any previous existing data in the m040.cities and m040.city_stats collections.
 - Opens the data.json file and process it in batches. Each batch is processed by its own thread/process to simulate concurrent database write load.
 - Each batch process starts a session.
 - For each session, a transaction gets initiated:
   - Writes the batch of city documents into m040.cities collection.
   - Updates the m040.city_stats total population field.
   
The data.json is json file that contains one hundred imaginary cities and their (imaginary) population counts.

    {"_id":0,"name":"Weclotur","population":37204107}
    {"_id":1,"name":"Ufdadre","population":4195149}
    {"_id":2,"name":"Gabepfo","population":24774878}
    {"_id":3,"name":"Hugecuif","population":26971343}
    {"_id":4,"name":"Getjawi","population":20333849}
    {"_id":5,"name":"Wuihnov","population":32181480}
    {"_id":6,"name":"Nivkahji","population":35589367}
    {"_id":7,"name":"Nazpomso","population":11306436}
    {"_id":8,"name":"Fewluce","population":2837975}
    {"_id":9,"name":"Imuducroj","population":25131345}
    {"_id":10,"name":"Ezokugfi","population":13329365}
    {"_id":11,"name":"Ewewedu","population":19742788}
    {"_id":12,"name":"Ujlafzoz","population":24145814}
    {"_id":13,"name":"Goddivref","population":17166781}
    ...

Within data.json there are some logical errors, like duplicate keys, which were introduced on purpose. Do not change this file.

## Setup

In order for the loader.py script to execute you will have to have a running replica set, M040.

Using this course VM, you can set up the replica set by running the following commands:

    cd m040-vagrant-env
    vagrant up
    vagrant ssh
    mkdir -p ~/repl/{1,2,3}
    mongod --dbpath ~/repl/1 --logpath ~/repl/1/log --port 27017 --replSet M040 --bind_ip_all --fork
    mongod --dbpath ~/repl/2 --logpath ~/repl/2/log --port 27027 --replSet M040 --bind_ip_all --fork
    mongod --dbpath ~/repl/3 --logpath ~/repl/3/log --port 27037 --replSet M040 --bind_ip_all --fork
    
    mongo --eval 'rs.initiate()'
    mongo --eval 'rs.add("m040:27027");rs.add("m040:27037")'
	
We recommend you run this script using this course virtual machine (m040-vagrant-env). However, you can still run it from your local workstation by providing the --uri option to either the virtual machine-hosted replica set or a different one running in your own system. Just make sure it is running MongoDB version 4.0 and that you have python3 installed.

To run the script using the course VM, run the following commands:

    cp loader.py m040-vagrant-env/shared
    cp data.json m040-vagrant-env/shared
    cd m040-vagrant-env
    vagrant ssh
    cd /shared/
    python3 loader.py

To run it locally, make sure you have python3 installed and run the following:

    cd <UNZIPPED_HANDOUTS_PATH>
    pip3 install -r requirements.txt
    python3 loader.py --uri "mongodb://<REPLICA_SET_HOST>/m040?replicaSet=<YOUR_REPLICA_NAME>"

## Requirements

The script will insert data in batches of ten documents, and each batch must be loaded entirely. In the case of logical error (e.g. DuplicateKey or MalformedDocument) we need to abort that batch. However, the script should be resilient to write conflicts and transient OperationFailure and ConnectionFailure.

The script, in its current state, does not handle any transaction related operational errors or exceptions. That's your job to figure it out!

You can either edit the script to make sure you get it right or review the options below and determine which ones will implement the appropriate error handling for the handle_commit and load_data functions. The sections for you to implement are marked with the following message:

    # LAB - needs error handling

## Validation

If you do edit the script and get error handling working correctly, the script should return the following message:

    Documents Inserted: 70
    Total Population: 1231255082

To complete this lab, identify the appropriate error handling code sample(s) that will enable the scripts to execute correctly.

Check all answers that apply:

 - Code Block A

in handle_commit(s)

    def handle_commit(s):
        """
        Handles the commit operation.
        """
        # LAB - needs error handling
        while True:
            try:
                s.commit_transaction()
                break
            except (pymongo.errors.OperationFailure, pymongo.errors.ConnectionFailure) as exc:
                if exc.has_error_label("UnknownTransactionCommitResult"):
                    print("Commit error: {} retrying commit ... ".format(exc))
                    continue
                else:
                    raise
				
 - Code Block B

in load_data(q, batch, uri)

    # LAB - needs error handling
    with mc.start_session() as s:
      while True:
          try:
              batch_total_population,batch_docs = write_batch(batch, mc, s)
              break
          except (pymongo.errors.OperationFailure, pymongo.errors.ConnectionFailure) as exc:
              if exc.has_error_label("TransientTransactionError"):
                 print("Error detected: {} - abort".format(exc))
                 s.abort_transaction()
                 continue
              else:
                 raise
			 
 - Code Block C

in load_data(q, batch, uri)

    # LAB - needs error handling
    with mc.start_session() as s:
        while True:
            try:
                batch_total_population,batch_docs = write_batch(batch, mc, s)
                break
            except (Exception) as exc:
                print("Error detected: {} - retrying".format(exc))
                continue
			
 - Code Block D

in handle_commit(s)

    def handle_commit(s):
        """
        Handles the commit operation.
        """
        # LAB - needs error handling
        try:
            s.commit_transaction()
            break
        except (pymongo.errors.OperationFailure) as exc:
            if exc.has_error_label("TransientTransactionError"):
                print("Error detected: {} - abort".format(exc))
                s.abort_transaction()
                continue
            else:
                raise

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>Code Block A

in handle_commit(s)

    def handle_commit(s):
        """
        Handles the commit operation.
        """
        # LAB - needs error handling
        while True:
            try:
                s.commit_transaction()
                break
            except (pymongo.errors.OperationFailure, pymongo.errors.ConnectionFailure) as exc:
                if exc.has_error_label("UnknownTransactionCommitResult"):
                    print("Commit error: {} retrying commit ... ".format(exc))
                    continue
                else:
                    raise
   </li>
<li>Code Block B

in load_data(q, batch, uri)

    # LAB - needs error handling
    with mc.start_session() as s:
      while True:
          try:
              batch_total_population,batch_docs = write_batch(batch, mc, s)
              break
          except (pymongo.errors.OperationFailure, pymongo.errors.ConnectionFailure) as exc:
              if exc.has_error_label("TransientTransactionError"):
                 print("Error detected: {} - abort".format(exc))
                 s.abort_transaction()
                 continue
              else:
                 raise
</li></ul>
</details>
