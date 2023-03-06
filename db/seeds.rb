# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

quizzes = Quiz.create([
  {
    user_id: 2,
    subject: 'Math',
    length: 5,
    response: {
      title: "Math Quiz",
      description: "Test your math skills with these five questions.",
      questions: [
        {
          type: "multiple-choice",
          question: "What is the square root of 16?",
          choices: ["2", "4", "8", "16"],
          correctAnswer: "4"
        },
        {
          type: "fill-in-the-blank",
          question: "What is the value of x if 3x + 4 = 13?",
          correctAnswer: "3"
        },
        {
          type: "true-false",
          question: "Is 0 a prime number?",
          correctAnswer: "false"
        },
        {
          type: "multiple-choice",
          question: "What is the value of pi (π) rounded to two decimal places?",
          choices: ["3.14", "3.141", "3.1415", "3.14159"],
          correctAnswer: "3.14"
        },
        {
          type: "fill-in-the-blank",
          question: "What is the slope of the line y = 2x + 3?",
          correctAnswer: "2"
        }
      ]
    }
  },
  {
    user_id: 2,
    subject: 'Science',
    length: 5,
    response: {
      title: "Science Quiz",
      description: "Test your knowledge of science with these five questions.",
      questions: [
        {
          type: "multiple-choice",
          question: "What is the smallest unit of life?",
          choices: ["Cell", "Atom", "Molecule", "Organ"],
          correctAnswer: "Cell"
        },
        {
          type: "true-false",
          question: "The sun is a planet.",
          correctAnswer: "false"
        },
        {
          type: "multiple-choice",
          question: "What type of energy is stored in a battery?",
          choices: ["Chemical", "Nuclear", "Solar", "Wind"],
          correctAnswer: "Chemical"
        },
        {
          type: "fill-in-the-blank",
          question: "What is the process by which plants use sunlight to make food?",
          correctAnswer: "Photosynthesis"
        },
        {
          type: "multiple-choice",
          question: "What is the largest organ in the human body?",
          choices: ["Liver", "Skin", "Heart", "Brain"],
          correctAnswer: "Skin"
        }
      ]
    }

  },
  {
    user_id: 2,
    subject: 'Geography',
    length: 4,
    response: {
      title: "Geography Quiz",
      description: "Test your knowledge of geography with these five questions.",
      questions: [
        {
          type: "multiple-choice",
          question: "What is the capital of Australia?",
          choices: ["Sydney", "Melbourne", "Canberra", "Brisbane"],
          correctAnswer: "Canberra"
        },
        {
          type: "true-false",
          question: "The Amazon River is the longest river in the world.",
          correctAnswer: "false"
        },
        {
          type: "multiple-choice",
          question: "What is the highest mountain in Africa?",
          choices: ["Kilimanjaro", "Mount Everest", "Mount Kenya", "Mount Meru"],
          correctAnswer: "Kilimanjaro"
        },
        {
          type: "fill-in-the-blank",
          question: "What is the largest country by land area?",
          correctAnswer: "Russia"
        }
      ]
    }
  },
])