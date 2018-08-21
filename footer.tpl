{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if !$content_only}
<br /><br />
<div style="padding-bottom: 10px;" class="puncovny">
	<div class="kvalita" style="width: 20%; float:left;">
		<div style="float:left;">
			<img src="/img/cms/puncovny-urad-sr.png" alt="" />
		</div>
		<div style="margin-left: 10px; padding-top: 10px;">
		Puncovný úrad SR<br />
		Sme registrovaní
		</div>
	</div>
	<div class="kvalita" style="width: 20%; float:left;">
		<div style="float:left;">
			<img src="/img/cms/dodanie-do-24-hodin.png" alt="" />
		</div>
		<div style="float:left; padding-left: 5px; padding-top: 10px;">
		ihneď expedujeme<br />
		všetko skladom
		</div>
	</div>
	<div class="kvalita" style="width: 20%; float:left;">
		<div style="float:left;">
			<img src="/img/cms/nad-50-euro-doprava-zdarma.png" alt="" />
		</div>
		<div style="float:left; padding-left: 5px; padding-top: 10px;">
		Doprava zdarma<br />
		nad 50 Eur
		</div>
	</div>
	<div class="kvalita" style="width: 20%; float:left;">
		<div style="float:left;">
			<img src="/img/cms/14-dni-na-vratenie-tovaru.png" alt="" />
		</div>
		<div style="float:left; padding-left: 5px; padding-top: 10px;">
		14 dní na<br />
		vrátenie tovaru
		</div>
	</div>
	<div class="kvalita" style="width: 20%; float:left;">
		<div style="float:left;">
			<img src="/img/cms/vernostny-program-argento.png" alt="" />
		</div>
		<div style="float:left; padding-left: 5px; padding-top: 10px;">
		Vernostný<br />
		program
		</div>
	</div>


</div>
<br /><br /><br /><br />

					</div><!-- #center_column -->
						{if isset($warehouse_vars.left_on_phones) && $warehouse_vars.left_on_phones == 1}
					{if isset($left_column_size) && !empty($left_column_size)}
					<div id="left_column" class="column col-xs-12 col-sm-{$left_column_size|intval} col-sm-pull-{12 - $left_column_size - $right_column_size}">{$HOOK_LEFT_COLUMN}</div>
					{/if}
					{/if}
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			<!-- Footer -->
			{hook h='footerTopBanner'}




			<div class="footer-container {if isset($warehouse_vars.f_wrap_width) && $warehouse_vars.f_wrap_width == 0} container {/if}">
				{if isset($warehouse_vars.footer_width) && $warehouse_vars.footer_width == 1}
				{if isset($warehouse_vars.footer1_status) && $warehouse_vars.footer1_status == 1}
				<div class="footer-container-inner1">
				<footer id="footer1"  class="container">
					<div class="row">{hook h='displayAdditionalFooter'}</div>
				</footer>
				</div>
				{/if}
				{if isset($HOOK_FOOTER)}
				<div class="footer-container-inner">
				<footer id="footer"  class="container">
					<div class="row">{$HOOK_FOOTER}</div>
				</footer>
				</div>
				{/if}
				{elseif isset($warehouse_vars.footer_width) && $warehouse_vars.footer_width == 0}
				{if isset($warehouse_vars.footer1_status) && $warehouse_vars.footer1_status == 1}
				<footer id="footer1"  class="container footer-container-inner1">

					<div class="row">{hook h='displayAdditionalFooter'}</div>

				</footer>
				{/if}
				{if isset($HOOK_FOOTER)}
				<footer id="footer"  class="container footer-container-inner">

					<div class="row">{$HOOK_FOOTER}</div>

				</footer>
				{/if}
				{/if}


			{if isset($warehouse_vars.second_footer)  && $warehouse_vars.second_footer == 1}
			{if isset($warehouse_vars.header_style) && ($warehouse_vars.header_style != 1)}
			<div class="footer_copyrights">
				<footer class="container clearfix">
					<div class="row">
						{if isset($warehouse_vars.copyright_text)}<div class=" {if isset($warehouse_vars.footer_img_src)}col-sm-6{else}col-sm-12{/if}"> {$warehouse_vars.copyright_text}  </div>{/if}





					</div>
				</footer></div>
				{/if}{/if}

			</div><!-- #footer -->
		</div><!-- #page -->
{/if}
{if !$content_only}<div id="toTop" class="transition-300"></div>
{hook h='belowFooter'}{/if}
{include file="$tpl_dir./global.tpl"}
{if $page_name == 'index'}
<script type="application/ld+json">
{literal}
{
  "@context": "http://schema.org",
  "@type": "WebSite",
  "url": "{/literal}{$base_dir_ssl}{literal}",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "{/literal}{$base_dir_ssl}{literal}index.php?controller=search&search_query={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
{/literal}
</script>
{/if}<div id="pp-zoom-wrapper">
</div>


<!-- livezilla.net PLACE SOMEWHERE IN BODY -->
<script type="text/javascript" id="79fa7cd8a14cdf2ffb14a2b398e33d36" src="https://argento.sk/livezilla/script.php?id=79fa7cd8a14cdf2ffb14a2b398e33d36"></script>
<!-- livezilla.net PLACE SOMEWHERE IN BODY -->


	</body>
</html>
