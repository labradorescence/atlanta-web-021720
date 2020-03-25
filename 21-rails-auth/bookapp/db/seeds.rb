author = Author.create(username: 'admin', password: 'password')
author2 = Author.create(username: 'test', password: 'password')

book = Book.create(title: 'Flatiron Handbook', desc: 'Code of Conduct', author_id: author.id)
book2 = Book.create(title: 'Harry Potter', desc: 'Really cool.', author_id: author2.id)
book3 = Book.create(title: 'Harry Potter 2', desc: 'Really cool 2.', author_id: author2.id) 
