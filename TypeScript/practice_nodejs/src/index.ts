import app from './app'

const port = process.env.PORT || 1337

app.listen(port, (err) => {
  if(err) {
    return console.log(err)
  }

  return console.log(`server is listening on ${port}`)
})
