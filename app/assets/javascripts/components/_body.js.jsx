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

  handlePlayer(player) {
    this.setState({ player: player })
  },

  handleCard(card) {
    var newState = this.state.cards.concat(card);
    this.setState({ cards: newState })
  },

  render() {
    return (
      <div>
        <AllCards cards={this.state.cards}/>
        <NewCard handleCard={this.handleCard} />
        <NewPlayer handlePlayer={this.handlePlayer} />
      </div>
    )
  }
})