# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Vertical.create( 
                
  name: "Health & Fitness",
  categories_attributes: [
    {
      name: "Booty & Abs",
      state: :active,
      courses_attributes: [
        {
          name: "Loose the Gutt, keep the Butt",
          author: "Anowa",
          state: :active
        },
        {
          name: "BrittneBabe Fitness Transformation",
          author: "Brittnebabe",
          state: :active
        }
      ]
    },
    {
      name: "Full Body",
      state: :active,
      courses_attributes: [
        {
          name: "BTX: Body Transformation Extreme",
          author: "Barstarzz",
          state: :active
        },
        {
          name: "Facebook Funnel Marketing",
          author: "Russell Brunson",
          state: :active
        }
      ]
    }
  ]
)

Vertical.create( 
                
  name: "Business",
  categories_attributes: [
    {
      name: "Advertising",
      state: :active,
      courses_attributes: [
        {
          name: "Build a Wild Audience",
          author: "Tim Nilson",
          state: :active
        }
      ]
    },
    {
      name: "Writing",
      state: :active,
      courses_attributes: [
        {
          name: "Editorial Writing Secrets",
          author: "J. K. Rowling",
          state: :active
        },
        {
          name: "Scientific Writing",
          author: "Stephen Hawking",
          state: :active
        }
      ]
    }
  ]
)

Vertical.create( 
                
  name: "Music",
  categories_attributes: [
    {
      name: "Singing",
      state: :active,
      courses_attributes: [
        {
          name: "Vocal Training 101",
          author: "Linkin Park",
          state: :active
        },
        {
          name: "Music Production",
          author: "Lady Gaga",
          state: :active
        }
      ]
    },
    {
      name: "Music Fundamentals",
      state: :active,
      courses_attributes: [
        {
          name: "Learn the Piano",
          author: "Lang Lang",
          state: :active
        },
        {
          name: "Become a guitar hero",
          author: "Jimmy Page",
          state: :active
        }
      ]
    }
  ]
)