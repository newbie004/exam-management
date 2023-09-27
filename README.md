# README

# README

* ruby version: 3.2.2
* rails version: 7.0.8


To run this Application
* After cloning, migrate the database by running `rails db:migrate` to create tables.

* [POST] API END POINT for college creation => http://localhost:3000/colleges/
* Sample body for college creation
      {
            "college": {
                  "name": "Kirorimal College"
            }
      }

* [POST] API END POINT for exam creation => http://localhost:3000/exams/
* Sample body for college creation
      {
            "exam": {
                  "name": "Kirorimal College",
                  "college_id": 1
            }
      }
Here valid college id should be passed, or it can be null.

* [POST] API END POINT for exam creation => http://localhost:3000/exam_windows/
* Sample body for exam_window
      {
            "exam_window": {
                  "exam_id": "13",
                  "start_time": "2023-10-01",
                  "end_time": "2023-11-01"
            }
      }

After populating the college, exam, and exam_window, we can hit allocate_exam

* [POST] API END POINT - http://localhost:3000/allocate_exam

* Sample Body for /allocate_exam
      {
            "allocator": {
            "first_name": "Raj",
            "last_name": "Kamal",
            "phone_number": "123-456-7890",
            "college_id": 1,
            "exam_id": 1,
            "start_time": "2023-10-01T10:00:00Z"
            }
      }
