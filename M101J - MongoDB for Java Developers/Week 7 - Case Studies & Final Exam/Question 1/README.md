# Problem
Please download <a href="https://s3.amazonaws.com/edu-downloads.10gen.com/enron/enron.zip">the Enron email dataset (link here)</a>, unzip it and then restore it using mongorestore. Note that this is an abbreviated version of the full corpus. There should be 120,477 documents after restore.

The command for mongorestore is:

    mongorestore --port <port number> -d enron -c messages <path to BSON file>

Inspect a few of the documents to get a basic understanding of the structure. Enron was an American corporation that engaged in a widespread accounting fraud and subsequently failed.

In this dataset, each document is an email message. Like all Email messages, there is one sender but there can be multiple recipients.

Construct a query to calculate the number of messages sent by Andrew Fastow, CFO, to Jeff Skilling, the president. Andrew Fastow's email addess was andrew.fastow@enron.com. Jeff Skilling's email was jeff.skilling@enron.com.

For reference, the number of email messages from Andrew Fastow to John Lavorato (john.lavorato@enron.com) was 1.

Choose the best answer:
 - 1
 - 3
 - 5
 - 7
 - 9
 - 12

<details>
  <summary>Click here for the solution</summary>
  - 3
</details>