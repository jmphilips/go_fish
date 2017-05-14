var Body = React.createClass({
   getInitialState() {
    return { cards: [] }
  },

  componentDidMount() {  
    var xhr = new XMLHttpRequest();
    xhr.responseType = 'json'
    xhr.open("POST", "/graphql")
    xhr.setRequestHeader("Content-Type", "application/json")
    xhr.setRequestHeader("Accept", "application/json")
    xhr.onload = () => {
      console.log(xhr.response.data.all_cards)
      this.setState({ cards: xhr.response.data.all_cards })
    }
    xhr.send(JSON.stringify({query: "{ all_cards {card_number suit} }"}))

  },

  handleSubmit(card) {
    console.log(card)
  },

  render() {
    return (
      <div>
        <AllCards cards={this.state.cards}/>
        <NewCard handleSubmit={this.handleSubmit} />
      </div>
    )
  }
})