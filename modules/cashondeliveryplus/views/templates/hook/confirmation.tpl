<!-- MODULE Cash on Delivery Plus - confirmation.tpl -->
	<p class="alert alert-success">
		{l s='Congratulation!' mod='cashondeliveryplus'} {l s='Your order' mod='cashondeliveryplus'} {if !isset($reference)}{l s='#' mod='cashondeliveryplus'}{$id_order}{else}{$reference}{/if} {l s='with amount' mod='cashondeliveryplus'} {$total_to_pay} {l s='is successfully complete.' mod='cashondeliveryplus'}
	</p>
    <div class="box order-confirmation">
		{l s='You have chosen the cash on delivery method.' mod='cashondeliveryplus'}
		<br /><strong>{l s='Your order will be sent very soon.' mod='cashondeliveryplus'}</strong>
		<br />{l s='If you have questions, comments or concerns, please contact our' mod='cashondeliveryplus'} <a href="{$link->getPageLink('contact', true)|escape:'html':'UTF-8'}">{l s='expert customer support team' mod='cashondeliveryplus'}</a>.
	</div>
<!-- /MODULE Cash on Delivery Plus - confirmation.tpl -->
