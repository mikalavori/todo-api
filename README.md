# README


```
User.create username: 'pippo', email: 'pippo@example.com', password: 'password', password_confirmation: 'password'
```
token:
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.Qd8CUvxEfETFilsrLE4SIRNb0xwAzdWrqssfcHhVjHw


curl -H "Content-Type: application/json" -X POST -d '{"user":{"username":"pluto","email":"pluto@example.com","password":"password", "password_confirmation":"password"}}' api.todos.dev:3000/user

curl -H "Content-Type: application/json" -X POST -d '{"email":"pluto@example.com","password":"password"}' api.todos.dev:3000/user/authenticate

curl -H "Content-Type: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.GXHYzj3Xt3UKr0-TKvme8OYklOm0AQcTcCwQ672gdCI" -X GET api.todos.dev:3000/user/todos
curl -H "Content-Type: application/json" -H "Authorization: Bearer invalid" -X GET api.todos.dev:3000/user/todos

curl -H "Content-Type: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.GXHYzj3Xt3UKr0-TKvme8OYklOm0AQcTcCwQ672gdCI" -X POST -d '{"todo":{"title":"prova"}}' api.todos.dev:3000/user/todos
