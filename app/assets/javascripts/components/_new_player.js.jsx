var NewPlayer = React.createClass({
  handleClick() {
    var query = `
      mutation addPlayer($input: AddPlayerInput!) {
        addPlayer(input: $input) {
          player {
            name
            id
          }
        }
      }
    `
    var variables = `
      {
        "input": {
          "name": "Josh"
        }
      }
    `
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'json'
    xhr.open("Post", "/graphql")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.setRequestHeader("Accept", "application/json")
    xhr.onload = () => {
      this.props.handlePlayer(xhr.response.data.addPlayer.player)
    }
    xhr.send(JSON.stringify({query: query, variables: variables}))
  },
  render() {
    return (
      <div>
        <button onClick={this.handleClick}>Join Game</button>
      </div>
    )
  }
})


