var NewCard = React.createClass({
  handleClick() {
    var query =
      `
        mutation addCard($input: AddCardInput!) {
          addCard(input: $input) {
            card {
              suit
              card_number
            }
          }
        }
      `
    var variables =
      `
        {
          "input": {
            "player_id": 9
          }
        }
      `
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'json'
    xhr.open("POST", "/graphql")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.setRequestHeader("Accept", "application/json")
    xhr.onload = () => {
      this.props.handleCard(xhr.response.data.addCard.card)
    }
    xhr.send(JSON.stringify({query: query, variables: variables}))
  },

  render() {
    return (
      <div>
        <button onClick={this.handleClick}>Create card</button>
      </div>
    )
  }
})
