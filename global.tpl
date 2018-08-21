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
{strip}
{addJsDef isMobile=$mobile_device}
{addJsDef baseDir=$content_dir}
{addJsDef baseUri=$base_uri}
{addJsDef static_token=$static_token}
{addJsDef token=$token}
{addJsDef priceDisplayPrecision=$priceDisplayPrecision*$currency->decimals}
{addJsDef priceDisplayMethod=$priceDisplay}
{addJsDef roundMode=$roundMode}
{addJsDef currency=$currency}
{addJsDef currencyRate=$currencyRate|floatval}
{addJsDef currencySign=$currency->sign|html_entity_decode:2:"UTF-8"}
{addJsDef currencyFormat=$currency->format|intval}
{addJsDef currencyBlank=$currency->blank|intval}
{addJsDef isLogged=$is_logged|intval}
{addJsDef isGuest=$is_guest|intval}
{addJsDef page_name=$page_name|escape:'html':'UTF-8'}
{addJsDef contentOnly=$content_only|boolval}
{if isset($cookie->id_lang)}
	{addJsDef id_lang=$cookie->id_lang|intval}
{/if}
{addJsDefL name=FancyboxI18nClose}{l s='Close'}{/addJsDefL}
{addJsDefL name=FancyboxI18nNext}{l s='Next'}{/addJsDefL}
{addJsDefL name=FancyboxI18nPrev}{l s='Previous'}{/addJsDefL}
{addJsDef usingSecureMode=Tools::usingSecureMode()|boolval}
{addJsDef ajaxsearch=Configuration::get('PS_SEARCH_AJAX')|boolval}
{addJsDef instantsearch=Configuration::get('PS_INSTANT_SEARCH')|boolval}
{addJsDef quickView=$quick_view|boolval}
{addJsDef displayList=$warehouse_vars.productlist_view|intval}

{if isset($warehouse_vars.is_rtl) && $warehouse_vars.is_rtl}
{addJsDef isRtl=true|boolval}
{else}
{addJsDef isRtl=false|boolval}
{/if} 
{addJsDef grid_size_lg=$warehouse_vars.grid_size_lg|intval}
{addJsDef grid_size_md=$warehouse_vars.grid_size_md|intval}
{addJsDef grid_size_sm=$warehouse_vars.grid_size_sm|intval}
{addJsDef grid_size_ms=$warehouse_vars.grid_size_ms|intval}
{addJsDef grid_size_xs=$warehouse_vars.grid_size_xs|intval}


{capture name="nbItemsPerLineLarge"}{hook h='calculateGrid' size='large'}{/capture}
{capture name="nbItemsPerLine"}{hook h='calculateGrid' size='medium'}{/capture}
{capture name="nbItemsPerLineTablet"}{hook h='calculateGrid' size='small'}{/capture}
{capture name="nbItemsPerLineMobile"}{hook h='calculateGrid' size='mediumsmall'}{/capture}
{capture name="nbItemsPerLineMobileS"}{hook h='calculateGrid' size='xtrasmall'}{/capture}

{addJsDef grid_size_lg2=$smarty.capture.nbItemsPerLineLarge|intval}
{addJsDef grid_size_md2=$smarty.capture.nbItemsPerLine|intval}
{addJsDef grid_size_sm2=$smarty.capture.nbItemsPerLineTablet|intval}
{addJsDef grid_size_ms2=$smarty.capture.nbItemsPerLineMobile|intval}
{addJsDef grid_size_xs2=$smarty.capture.nbItemsPerLineMobileS|intval}



{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}

{addJsDef ajax_popup=$warehouse_vars.ajax_popup|boolval}
{addJsDef highDPI=Configuration::get('PS_HIGHT_DPI')|boolval}
{/strip}