require('cypress-xpath');

describe('Login Page', () => {
    beforeEach(() => {
      cy.visit('http://localhost:8080');
    });
  
    it('should allow the user to login using existing valid credentials and redirect the user to the dashboard. the dashboard should display correct user information. ', () => {
        cy.fixture('account.json').then((accounts) => {
            const users = Object.keys(accounts);
            const randIndex = Math.floor(Math.random() * users.length);
            const user = accounts[users[randIndex]];
            
            console.log('user: ', user)
            cy.get('[placeholder="Enter Username"]').type(users[randIndex]);
            cy.get('[placeholder="password"]').type(user.password);
            cy.get('.sc-bZQynM').click();

            cy.xpath('//div[text()="Name"]/following-sibling::div').should('contain.text', user?.name ?? ''); 
            cy.xpath('//div[text()="Favourite Fruit"]/following-sibling::div').should('contain.text', user.favouriteFruit);
            cy.xpath('//div[text()="Favourite Movie"]/following-sibling::div').should('contain.text', user.favouriteMovie);
            cy.xpath('//div[text()="Favourite Number"]/following-sibling::div').should('contain.text', user.favouriteNumber);
      });
    });

});