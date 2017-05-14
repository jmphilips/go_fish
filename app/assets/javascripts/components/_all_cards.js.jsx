var AllCards = React.createClass({
 
    render() {
    var cards = this.props.cards.map((card) => {
      return (
        <div key={card.id}>
          <p>{card.card_number}{card.suit}</p>
        </div>
      )
    });

    return(
      <div>
        {cards}
      </div>
    )
  }
})

