describe('Not logged in tests', () => {

  // Visiting the homepage before each test
  beforeEach(() => {
    cy.visit('http://localhost:3000');
  });

  // Test for visiting a project
  it('Visit a project', () => {
    cy.get('#project-card').click();
    cy.url().should('include', '/projects/');
  });

  /*  // Test for making a payment (when not logged in)
   it('Make a payment', () => {
     cy.get('#project-card').click();
     cy.get('#inputMoneyAmount', { timeout: 10000 }).should('be.visible');
     cy.get('#inputMoneyAmount').type('125');
     cy.contains('Pay').click();
     cy.contains('You need to be logged in to make a payment.');
   }); */

  it('View payment on Etherscan', () => {
    cy.get('#project-card').click();
    cy.get(':nth-child(1) > #donation-notification').click();
    cy.window().then((win) => {
      cy.stub(win, 'open').as('windowOpen');
    });
    cy.get('#donation-notification').click();
    cy.get('@windowOpen').should('be.calledWithMatch', /https:\/\/sepolia\.etherscan\.io\/tx\/.+/);
  });

  // Test for searching projects
  it('Search projects', () => {
    cy.get('#search-input').click().type('gard');
    cy.get('#search-submit').click();
    cy.contains('Garden');
  });
});
