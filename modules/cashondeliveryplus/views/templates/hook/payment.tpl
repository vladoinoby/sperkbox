<!-- MODULE Cash on Delivery Plus - payment.tpl -->
<div class="row">
	<div class="col-xs-12">
		<p class="payment_module">
			<a class="bankwire" href="{$link->getModuleLink('cashondeliveryplus', 'validation', [], true)|escape:'html':'UTF-8'}" title="{l s='Pay with cash on delivery (COD)' mod='cashondeliveryplus'}" rel="nofollow">
				{l s='Cash on delivery' mod='cashondeliveryplus'}<br />
        {l s='You pay for the merchandise upon delivery.' mod='cashondeliveryplus'}
        {if $dobirecne != '0'}<br />{l s='Cash on delivery fee:' mod='cashondeliveryplus'} {$dobirecne}{/if}
			</a>
		</p>
	</div>
</div>
<!-- /MODULE Cash on Delivery Plus - payment.tpl -->
