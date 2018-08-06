### Final Exam
# Final Exam: Aggregation

## Problem:

Consider this document:

    {
      _id: 1,
      time: "10/01/2018"
    }

If we execute the following aggregation:

    db.collection.aggregate([
      {
        $addFields: {
          time: {
            $dateToParts: {
              date: {
                $dateFromString: {
                  dateString: "$time",
                  format: "%d/%m/%Y"
                }
              }
            }
          }
        }
      },
      {
        $project:{
          time: {
            $dateFromParts: {
              "month": {$add:[-13, "$time.month"]},
              "year": "$time.year"
            }
          }
        }
      }
    ])
	
Which of the following is/are true?

Pay attention to the format string in the $addFields stage

Check all answers that apply:

 - The day in the date field is 1st of December.
 - The aggregation command fails with an "Unknown format field error".
 - The aggregation command fails due to an out-of-bound date.
 - The year on the date is 2016.
 - The _id is not present in the output document.

<details>
  <summary>Click here for the solution</summary>
    <ul>
      <li>The day in the date field is 1st of December.</li>
	  <li>The year on the date is 2016.</li>
    </ul>
</details>