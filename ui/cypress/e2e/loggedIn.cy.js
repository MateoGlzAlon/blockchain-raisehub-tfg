describe('Logged in tests', () => {

    // Function to log in to the application
    const login = (username = 'user@example.com', password = 'pass1') => {
        cy.visit('http://localhost:3000');
        cy.contains('Log in').click();
        cy.get('#username').type(username);
        cy.get('#password').type(password);
        cy.contains('Log In').click();
    };

    // Run the login before each test
    beforeEach(() => {
        login();
    });

    it('Visit profile', () => {
        cy.get('#user-avatar').click();
        cy.contains('My Profile').click();
    });

    it('Visit a project', () => {
        cy.get('#project-card').click();
        cy.url().should('include', '/projects/');
    });

    it('Connect a wallet', () => {
        cy.get('#dynamic-widget').click();
    });

    it('Search projects', () => {
        cy.get('#search-input').type('gard');
        cy.get('#search-submit').click();
        cy.contains('Garden').should('be.visible');
    });

    it('View payment on Etherscan', () => {
        cy.get('#project-card').click();
        cy.get(':nth-child(1) > #donation-notification').click();
        cy.window().then((win) => {
            cy.stub(win, 'open').as('windowOpen');
        });
        cy.get('#donation-notification').click();
        cy.get('@windowOpen').should('be.calledWithMatch', /https:\/\/sepolia\.etherscan\.io\/tx\/.+/);
    });


});
