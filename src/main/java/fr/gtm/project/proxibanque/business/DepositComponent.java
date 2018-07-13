package fr.gtm.project.proxibanque.business;


import fr.gtm.project.proxibanque.Constants;
import fr.gtm.project.proxibanque.entity.Account;
import fr.gtm.project.proxibanque.entity.Message;
import fr.gtm.project.proxibanque.entity.TYPE_COMPTE;

public class DepositComponent {
	
	public Message depositCash(Account account, Float amount) {
		final Message result = new Message(
				"Dêpot confirmé, merci d'avoir utiliser notre service.");
		if (account.getBalance()>Constants.DEPOSIT_MAX  
				&& account.getType().equals(TYPE_COMPTE.MAIN)) {
			result.setError(true);
			result.setContent(
					"Montant de dépôt maximum 5000€.");
		}
		if(account.getBalance()<Constants.DEPOSIT_MIN && account.getType().equals(TYPE_COMPTE.MAIN)) {
			result.setError(true);
			result.setContent(
					"Montant de dépôt minimum 500€.");
		}
		return result;
	}
}
