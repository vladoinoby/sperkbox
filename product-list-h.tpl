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
{if isset($products) && $products}
	{*define numbers of product per line in other page for desktop*}






	{capture name="nbItemsPerLineLarge"}{hook h='calculateGrid' size='large'}{/capture}
	{capture name="nbItemsPerLine"}{hook h='calculateGrid' size='medium'}{/capture}
	{capture name="nbItemsPerLineTablet"}{hook h='calculateGrid' size='small'}{/capture}
	{capture name="nbItemsPerLineMobile"}{hook h='calculateGrid' size='mediumsmall'}{/capture}
	{capture name="nbItemsPerLineMobileS"}{hook h='calculateGrid' size='xtrasmall'}{/capture}



	{*define numbers of product per line in other page for tablet*}
	{assign var='nbLi' value=$products|@count}
	{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$smarty.capture.nbItemsPerLine assign=nbLines}
	{math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$smarty.capture.nbItemsPerLineTablet assign=nbLinesTablet}

	{if (isset($yotpo_stars_pl)  && $yotpo_stars_pl == 1) || (isset($warehouse_vars.yotpo_stars)  && $warehouse_vars.yotpo_stars == 1)}
	<script src="https://staticw2.yotpo.com/{$yotpoAppkey}/widget.js"></script>
	<script type="text/javascript">
	{literal}
	var yotpo = new Yotpo(yotpoAppkey, {"reviews":false,"testimonials":{"settings":{"default_tab":"product_tab","show_tab":"both"}},"testimonials_tab":false,"questions_and_answers":false,"questions_and_answers_standalone":false,"vendor_review_creation":false,"language":"en","comments":false,"host":"static","direction":"ltr"});
	Yotpo.ready(function() {
		yotpo.init();
	});
	{/literal}
	</script>
	{/if}

	{if isset($image_type) && isset($image_types[$image_type])}
		{assign var='imageSize' value=$image_types[$image_type].name}
	{else}
		{assign var='imageSize' value='home_default'}
	{/if}

	<!-- Products list -->
	<ul{if isset($id) && $id} id="{$id}"{/if} class="product_list grid row{if isset($class) && $class} {$class}{/if}">
	{foreach from=$products item=product name=products}
		{math equation="(total%perLine)" total=$smarty.foreach.products.total perLine=$smarty.capture.nbItemsPerLine assign=totModulo}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$smarty.capture.nbItemsPerLineTablet assign=totModuloTablet}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$smarty.capture.nbItemsPerLineMobile assign=totModuloMobile}
		{if $totModulo == 0}{assign var='totModulo' value=$smarty.capture.nbItemsPerLine}{/if}
		{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$smarty.capture.nbItemsPerLineTablet}{/if}
		{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$smarty.capture.nbItemsPerLineMobile}{/if}
		<li class="ajax_block_product {if isset($generatorGrid)} {$generatorGrid} {else}col-xs-{$smarty.capture.nbItemsPerLineMobileS} col-ms-{$smarty.capture.nbItemsPerLineMobile} col-sm-{$smarty.capture.nbItemsPerLineTablet} col-md-{$smarty.capture.nbItemsPerLine} col-lg-{$smarty.capture.nbItemsPerLineLarge} {/if} {if $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLine == 1} first-in-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} last-line{/if}{if $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.products.iteration%$smarty.capture.nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModuloMobile)} last-mobile-line{/if}">
			<div class="product-container">
				<div class="left-block">
					<div class="product-image-container">
						{if (isset($product.quantity) && $product.quantity > 0) || (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
							{hook h='displayProductAttributesPL' productid=$product.id_product}
						{/if}
						<a class="product_img_link"	href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" >

							{assign var='rolloverImage' value=ThemeEditor::getRolloverImageLink($product.link_rewrite, $product.id_product, $imageSize)}

							<img class="replace-2x img-responsive lazy img_0 img_1e"

							{if (isset($iqit_lazy_load)  && $iqit_lazy_load == 1) || (isset($warehouse_vars.iqit_lazy_load)  && $warehouse_vars.iqit_lazy_load == 1)}
							data-original="{$link->getImageLink($product.link_rewrite, $product.id_image, $imageSize)|escape:'html':'UTF-8'}"
							src="{$img_dir}blank.gif"
							{else}
							src="{$link->getImageLink($product.link_rewrite, $product.id_image, $imageSize)|escape:'html':'UTF-8'}"
							{/if}

							alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"

							{if isset($image_type) && isset($image_types[$image_type])}  width="{$image_types[$image_type].width}" height="{$image_types[$image_type].height}" {elseif isset($image_types['home_default'])} width="{$image_types['home_default'].width}" height="{$image_types['home_default'].height}" {/if}{if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if}  />

							{if isset($rolloverImage)}

							<img class="replace-2x img-responsive lazy img_1 img-rollover"
							data-rollover="{$rolloverImage|escape:'html':'UTF-8'}"
							src="{$img_dir}blank.gif"
							alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}"

							{if isset($image_type) && isset($image_types[$image_type])}  width="{$image_types[$image_type].width}" height="{$image_types[$image_type].height}" {elseif isset($image_types['home_default'])} width="{$image_types['home_default'].width}" height="{$image_types['home_default'].height}" {/if}{if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if}  />
							{/if}


						{hook h='displayCountDown' product=$product}
						</a>


						<div class="product-flags">
						{if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							{if isset($product.online_only) && $product.online_only}
								<span class="online-label {if isset($product.new) && $product.new == 1}online-label2{/if}">{l s='Online only'}</span>
							{/if}
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								{if $product.specific_prices.reduction_type == 'percentage'}
									<span class="sale-label">-{$product.specific_prices.reduction * 100}%</span>
								{/if}
								{if $product.specific_prices.reduction_type == 'amount'}
									<span class="sale-label">-{if !$priceDisplay}{convertPrice price=$product.price_without_reduction|floatval-$product.price|floatval}{else}{convertPrice price=$product.price_without_reduction|floatval-$product.price_tax_exc|floatval}{/if}</span>
								{/if}
							{/if}
						{if isset($product.new) && $product.new == 1}
								<span class="new-label">{l s='Novinka'}</span>
						{/if}
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
								<span class="sale-label">{l s='Sale!'}</span>

						{/if}
					</div>
					<div class="functional-buttons functional-buttons-grid clearfix">
						{if isset($quick_view) && $quick_view}
						<div class="quickview col-xs-6">
							<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}" title="{l s='Quick view'}">
								{l s='Quick view'}
							</a>
							</div>
						{/if}
						{hook h='displayProductListFunctionalButtons' product=$product}
						{if isset($comparator_max_item) && $comparator_max_item}
							<div class="compare col-xs-3">
								<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" title="{l s='Add to Compare'}">{l s='Add to Compare'}</a>
							</div>
						{/if}
					</div>
					{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
						{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
							<span class="availability availability-slidein {if (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}available-diff {/if}">
								{if ($product.allow_oosp || $product.quantity > 0)}
										<span class="availabile_product">{l s='Available'}</span>
								{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
						<!--			<span class="available-dif">
										{l s='Product available with different options'}
									</span> -->
								{else}
									<span class="out-of-stock">
										{l s='Out of stock'}
									</span>
								{/if}

							</span>
						{/if}
					{/if}
						{if isset($product.color_list)}
						<div class="color-list-container">{$product.color_list} </div>
					{/if}

					</div>
					{if isset($product.is_virtual) && !$product.is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
					{hook h="displayProductPriceBlock" product=$product type="weight"}
				</div>

        <div class=spacerlist>
        {* Added for attributes *}
        {if isset($product.combinations)}
        <div style="display:block; text-align: center; margin-bottom: 10px;">
            {foreach from=$product.combinations.values key=id_product_attribute item=combination}
              <span style="padding: 2px; margin-right: 2px; border: solid 1px; color: #979797; border-radius: 15px;"><a href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}" style="color: #979797;">{$combination.attributes_names|escape:'html':'UTF-8'}</a></span>
            {/foreach}
        </div>
        {/if}
        {* Added for attributes *}
      </div>

				<div class="right-block"  style="text-align: center;">
					<h5  class="product-name-container">
						{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
						<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" >
							{$product.name|truncate:60:'...'|escape:'html':'UTF-8'}
						</a>
					</h5>

<!--
          <div class="product-desc" >s
						{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
            <span class="product-reference">{if isset($product.reference)}Kód: {$product.reference}{else}&nbsp;{/if}</span>
            SKLADOM<br />
            {if isset($product.upc) && $product.upc!==""}
              Súprava: <a href="http://argento.sk/vyhladavanie?orderby=position&orderway=desc&search_query={$product.upc|escape:'htmlall':'UTF-8'}">{$product.upc|strip_tags|truncate:100:'...'}</a>
              <br />
  					  {hook h='displayAccesoriesOnLiswar' product=$product}
            {/if}
					</div>
-->


					{if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}

					<div  itemscope class="content_price">
						{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
							<span  class="price product-price">
								{hook h="displayProductPriceBlock" product=$product type="before_price"}
								{if !$priceDisplay}{convertPrice price=$product.price} s DPH{else}{convertPrice price=$product.price_tax_exc}{/if}
							</span>
							{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
								{hook h="displayProductPriceBlock" product=$product type="old_price"}
								<span class="old-price product-price">
									{displayWtPrice p=$product.price_without_reduction}
								</span>
								{if $product.specific_prices.reduction_type == 'percentage'}
									<span class="price-percent-reduction small">-{$product.specific_prices.reduction * 100}%</span>
								{/if}
								{if $product.specific_prices.reduction_type == 'amount'}
									<span class="price-percent-reduction small">-{if !$priceDisplay}{convertPrice price=$product.price_without_reduction|floatval-$product.price|floatval}{else}{convertPrice price=$product.price_without_reduction|floatval-$product.price_tax_exc|floatval}{/if}</span>
								{/if}
							{/if}
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{else}
								&nbsp;
						{/if}
					</div>

					{elseif $PS_CATALOG_MODE}
					{else}<div class="content_price">&nbsp;</div>
					{/if}

{if isset($product.wholesale_price) && $product.wholesale_price>0}
					{if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					<div  itemscope class="content_price">
						{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
							<span  class="price product-price">
								{hook h="displayProductPriceBlock" product=$product type="before_price"}
						        {convertPrice price=$product.wholesale_price*1.2}/g
							</span>
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{else}
								&nbsp;
						{/if}
					</div>
					{elseif $PS_CATALOG_MODE}
					{else}<div class="content_price">&nbsp;</div>
					{/if}
{/if}


          <div class="clearr"></div>
        	{hook h='displayProductListReviews' product=$product}

					{if (isset($yotpo_stars_pl)  && $yotpo_stars_pl == 1) || (isset($warehouse_vars.yotpo_stars)  && $warehouse_vars.yotpo_stars == 1)}
					<div class="yotpo bottomLine"
					data-appkey="{$yotpoAppkey}"
					data-domain="{$yotpoDomain}"
					data-product-id="{$product.id_product}"
					data-product-models=""
					data-name="{$product.name|escape:'htmlall':'UTF-8'}"
					data-url="{$product.link|escape:'htmlall':'UTF-8'}"
					data-image-url="{$link->getImageLink($product.link_rewrite, $product.id_image, '')}"
					data-bread-crumbs="">
				</div>

				{/if}
							<div class="button-container">
						{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
							{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
								{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
								<div class="pl-quantity-input-wrapper">
									<input type="text" name="qty" class="form-control qtyfield quantity_to_cart_{$product.id_product|intval}" value="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity > 1}{$product.product_attribute_minimal_quantity|intval}{else}{if isset($product.minimal_quantity)}{$product.minimal_quantity|intval}{else}1{/if}{/if}"/>
									<div class="quantity-input-b-wrapper">
										<a href="#" data-field-qty="quantity_to_cart_{$product.id_product|intval}" class="transition-300 pl_product_quantity_down">
											<span><i class="icon-caret-down"></i></span>
										</a>
										<a href="#" data-field-qty="quantity_to_cart_{$product.id_product|intval}" class="transition-300 pl_product_quantity_up ">
											<span><i class="icon-caret-up"></i></span>
										</a>
									</div>
								</div>
								<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{if isset($product.minimal_quantity)}{$product.minimal_quantity|intval}{else}1{/if}{/if}">
									<span>{l s='Add to cart'}</span>
								</a>
							{else}
								<a  class="button lnk_view btn" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
							<span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='More'}{/if}</span>
						</a>
							{/if}
							{else}
								<a class="button lnk_view btn" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
							<span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='More'}{/if}</span>
						</a>
						{/if}
						{hook h="displayProductPriceBlock" product=$product type='after_price'}
					</div>

				</div>

			</div><!-- .product-container> -->

		</li>
	{/foreach}
	</ul>

{/if}
