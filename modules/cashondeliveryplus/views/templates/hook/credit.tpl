<!-- MODULE Cash on Delivery Plus - credit.tpl -->
<div class="alert alert-info">
	<p><i class="icon-cog" style="color:#0080c0"></i> &nbsp; <a href="{$this_path}docs/read-me-citaj-ma.html" title="{l s='Cash on Delivery+ module documentation' mod='cashondeliveryplus'}" target="_blank" class="docwindow"><strong>{l s='Cash on Delivery+ module documentation' mod='cashondeliveryplus'}</strong></a></p>
	<p><i class="icon-book" style="color:#0080c0"></i> &nbsp; <a href="{$this_path}CHANGELOG.txt" title="{l s='Read module Changelog' mod='cashondeliveryplus'}" target="_blank" class="changelogwindow"><strong>{l s='Module Changelog' mod='cashondeliveryplus'}</strong></a></p>
	<p><i class="icon-book" style="color:#0080c0"></i> &nbsp; <a href="{$this_path}docs/licencne-podmienky.pdf" title="{l s='Read end-user license agreement' mod='cashondeliveryplus'}" target="_blank"><strong>{l s='End-user license agreement' mod='cashondeliveryplus'}</strong></a></p>
	<p><i class="icon-user" style="color:#0080c0"></i> &nbsp; {l s='Module author' mod='cashondeliveryplus'}: <strong>Gabriel Schwardy</strong>; <a href="http://www.caleydon.com/?refmod={$smarty.server.SERVER_NAME}" title="caleydon.com" target="_blank"><strong>www.caleydon.com</strong></a></p>
	<p><i class="icon-medkit" style="color:#0080c0"></i> &nbsp; {l s='PrestaShop help and support' mod='cashondeliveryplus'}: <a href="http://www.prestashop.sk/?refmod={$smarty.server.SERVER_NAME}" title="prestashop.sk" target="_blank"><strong>www.prestashop.sk</strong></a></p>
	<p><i class="icon-plus-square" style="color:#0080c0"></i> &nbsp; {l s='PrestaShop Modules & Themes Marketplace' mod='cashondeliveryplus'}: <a href="http://www.prestaplay.com/?refmod={$smarty.server.SERVER_NAME}" title="prestaplay.com" target="_blank"><strong>www.prestaplay.com</strong></a></p>
</div>
<!-- FancyBox JS -->
<script type="text/javascript">{literal}
	$(document).ready(function () {
		$('a.docwindow').fancybox({
			type: 'iframe',
			'width':950,
			'height':450,
		});
		$('a.changelogwindow').fancybox({
			type: 'iframe',
			'width':700,
			'height':350,
		});
	});{/literal}
</script>
<!-- /MODULE Cash on Delivery Plus - credit.tpl -->