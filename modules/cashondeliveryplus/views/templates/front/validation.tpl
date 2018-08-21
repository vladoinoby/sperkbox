<!-- Cash On Delivery Plus Module -->
{capture name=path}
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='cashondeliveryplus'}">{l s='Checkout' mod='cashondeliveryplus'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Cash on delivery (COD) payment' mod='cashondeliveryplus'}
{/capture}

<h1 class="page-heading">
	{l s='Order summary' mod='cashondeliveryplus'}
</h1>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="alert alert-warning">
        {l s='Your shopping cart is empty.' mod='cashondeliveryplus'}
    </p>
{else}
<form action="{$link->getModuleLink('cashondeliveryplus', 'validation', [], true)|escape:'html'}" method="post">
	<div class="box">
        <input type="hidden" name="confirm" value="1" />
        <h3 class="page-subheading">{l s='Cash on delivery (COD) payment' mod='cashondeliveryplus'}</h3>
            <p class="cheque-indent">
                <strong class="dark">
                    {l s='You have chosen the Cash on Delivery method.' mod='cashondeliveryplus'} {l s='Here is a short summary of your order:' mod='cashondeliveryplus'}
                </strong>
            </p>

        <p>
            {l s='The total amount of your order is' mod='cashondeliveryplus'}
            <span id="amount_{$currencies.0.id_currency}" class="price">{convertPrice price=$total}</span>
            {if $use_taxes == 1}
                {l s='tax incl.' mod='cashondeliveryplus'}
            {/if}

        </p>
        <br />
    </div>


		<p class="cart_navigation clearfix" id="cart_navigation">

				<button class="button btn btn-default button-medium" type="submit">
						<span>{l s='Objednávka s povinnosťou platby' mod='bankwire'}<i class="icon-chevron-right right"></i></span>
				</button>
				<a class="button-exclusive btn btn-default" href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}">
						<i class="icon-chevron-left"></i>{l s='Iné spôsoby úhrady' mod='bankwire'}
				</a>
		</p>

</form>
{/if}
<!-- /Cash On Delivery Plus Module -->
