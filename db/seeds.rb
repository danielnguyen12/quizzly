# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Quiz.create(
  user_id: 1,
  subject: 'Geography',
  length: 5,
  level: 10,
  response: {
    "title": "Geography Quiz",
    "description": "Test your knowledge of world geography",
    "questions": [
    {
    "type": "multiple-choice",
    "question": "What is the capital of France?",
    "choices": [
    "London",
    "Paris",
    "Rome",
    "Berlin"
    ],
    "correctAnswer": "Paris"
    },
    {
    "type": "checkbox",
    "question": "Which of the following are continents?",
    "choices": [
    "Africa",
    "India",
    "South America",
    "Russia",
    "Europe"
    ],
    "correctAnswer": [
    "Africa",
    "South America",
    "Europe"
    ]
    },
    {
    "type": "grid",
    "question": "Rate your familiarity with the following languages",
    "rows": [
    "Spanish",
    "Mandarin",
    "Arabic"
    ],
    "columns": [
    "Never heard of it",
    "Familiar",
    "Fluent"
    ]
    },
    {
    "type": "date",
    "question": "When did World War II begin?",
    "correctAnswer": "1939-09-01"
    }
    ]
    }
  )

Quiz.create(
  user_id: 1,
  subject: 'Math',
  length: 5,
  level: 10,
  response: {
    "title": "Mathematics Quiz",
    "description": "Test your knowledge of mathematics",
    "questions": [
      {
        "type": "multiple-choice",
        "question": "What is the value of pi (π)?",
        "choices": [
          "3.14",
          "3.141",
          "3.1415",
          "3.14159"
        ],
        "correctAnswer": "3.14159"
      },
      {
        "type": "checkbox",
        "question": "Which of the following are prime numbers?",
        "choices": [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7",
          "8",
          "9"
        ],
        "correctAnswer": [
          "2",
          "3",
          "5",
          "7"
        ]
      },
      {
        "type": "grid",
        "question": "Rate your familiarity with the following mathematical concepts",
        "rows": [
          "Algebra",
          "Geometry",
          "Calculus"
        ],
        "columns": [
          "Never heard of it",
          "Familiar",
          "Expert"
        ]
      },
      {
        "type": "date",
        "question": "When was Isaac Newton born?",
        "correctAnswer": "1642-01-04"
      }
    ]
    }
  )
  
Quiz.create(
  user_id: 1,
  subject: 'History',
  length: 5,
  level: 10,
  response: {
    "title": "History Quiz",
    "description": "Test your knowledge of world history",
    "questions": [
      {
        "type": "multiple-choice",
        "question": "Who was the first president of the United States?",
        "choices": [
          "George Washington",
          "Thomas Jefferson",
          "Abraham Lincoln",
          "John Adams"
        ],
        "correctAnswer": "George Washington"
      },
      {
        "type": "checkbox",
        "question": "Which of the following were involved in World War I?",
        "choices": [
          "United States",
          "Germany",
          "France",
          "Russia",
          "Japan"
        ],
        "correctAnswer": [
          "Germany",
          "France",
          "Russia"
        ]
      },
      {
        "type": "grid",
        "question": "Rate your knowledge of the following historical events",
        "rows": [
          "American Revolution",
          "French Revolution",
          "Industrial Revolution"
        ],
        "columns": [
          "No knowledge",
          "Some knowledge",
          "Extensive knowledge"
        ]
      },
      {
        "type": "date",
        "question": "When did the Cold War begin?",
        "correctAnswer": "1947-09-02"
      }
    ]
  }
  )
