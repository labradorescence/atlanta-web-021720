
p "Finished cleaning database- reseeding!"

Friend.create(name: "Myself", age: 35)
Friend.create(name: "Ariel", age: 100)
Friend.create(name: "Joey", age: 58)
Friend.create(name: "Susan", age: 72)
Friend.create(name: "Chan", age: 20)


Conversation.create(topic: "Happy", length: 100, friend_id: 20)
Conversation.create(topic: "Sad", length: 10, friend_id: 21)
Conversation.create(topic: "Mad", length: 12, friend_id: 22)
Conversation.create(topic: "Confused", length: 156, friend_id: 23)
Conversation.create(topic: "Disgusted", length: 19, friend_id: 24)

p "All done. Your data is loaded!"

