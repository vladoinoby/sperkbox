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
{assign var='post_type' value=$post->post_type}
{capture name=path}
	<a href="{$link->getModuleLink('ph_simpleblog', 'list')|escape:'html':'UTF-8'}" title="{l s='Back to blog homepage' mod='ph_simpleblog'}">
		 <span itemprop="title">{l s='Blog' mod='ph_simpleblog'}</span>
	</a>
	<span class="navigation-pipe">
		{$navigationPipe|escape:'html':'UTF-8'}
	</span>
	{if isset($post->parent_category) && $post->parent_category != ''}
		<a href="{$link->getModuleLink('ph_simpleblog', 'category', ['sb_category' => $post->parent_category->link_rewrite])|escape:'html':'UTF-8'}"> <span itemprop="title">{$post->parent_category->name|escape:'html':'UTF-8'}</span></a>
		<span class="navigation-pipe">
			{$navigationPipe|escape:'html':'UTF-8'}
		</span>
	{/if}
	<a href="{$post->category_url|escape:'html':'UTF-8'}" title="{l s='Visit category' mod='ph_simpleblog'}"> <span itemprop="title">{$post->category|escape:'html':'UTF-8'}</span></a>
	<span class="navigation-pipe">
		{$navigationPipe|escape:'html':'UTF-8'}
	</span> 

	{$post->title|escape:'html':'UTF-8'}
{/capture}

{if !$is_16}
	{include file="$tpl_dir./breadcrumb.tpl"}
{/if}

{include file="$tpl_dir./errors.tpl"}

{if isset($smarty.get.confirmation)}
	<div class="success alert alert-success">
	{if $smarty.get.confirmation == 1}
		{l s='Your comment was sucessfully added.' mod='ph_simpleblog'}	
	{else}
		{l s='Your comment was sucessfully added but it will be visible after moderator approval.' mod='ph_simpleblog'}	
	{/if}
	</div><!-- .success alert alert-success -->
{/if}

<div itemscope="itemscope" itemtype="http://schema.org/Blog" itemprop="mainContentOfPage">
	<div class="ph_simpleblog simpleblog-single {if !empty($post->featured_image)}with-cover{else}without-cover{/if} simpleblog-single-{$post->id_simpleblog_post|intval}" itemscope="itemscope" itemtype="http://schema.org/BlogPosting" itemprop="blogPost">
		<h1 class="page-heading" itemprop="headline">
			{$post->title|escape:'html':'UTF-8'}
		</h1>

		<div class="post-meta-info">
			{if Configuration::get('PH_BLOG_DISPLAY_DATE')}
				<span class="post-date">
					<i class="icon icon-calendar"></i> <time itemprop="datePublished" datetime="{$post->date_add|date_format:'c'}">{$post->date_add|date_format:Configuration::get('PH_BLOG_DATEFORMAT')}</time>
				</span>
			{/if}
			
			{if Configuration::get('PH_BLOG_DISPLAY_CATEGORY')}
				<span class="post-category">
					<i class="icon icon-tags"></i> <a href="{$link->getModuleLink('ph_simpleblog', 'list', ['sb_category' => $post->category_rewrite])|escape:'html':'UTF-8'}" title="{$post->category|escape:'html':'UTF-8'}">{$post->category|escape:'html':'UTF-8'}</a>
				</span>
			{/if}

			{if isset($post->author) && !empty($post->author) && Configuration::get('PH_BLOG_DISPLAY_AUTHOR')}
				<span class="post-author">
					<i class="icon icon-user"></i> <span itemprop="author" itemscope="itemscope" itemtype="http://schema.org/Person">{$post->author|escape:'html':'UTF-8'}</span>
				</span>
			{/if}

			{if $post->tags && Configuration::get('PH_BLOG_DISPLAY_TAGS') && isset($post->tags_list)}
				<span class="post-tags clear">
					{l s='Tags:' mod='ph_simpleblog'} 
					{foreach from=$post->tags_list item=tag name='tagsLoop'}
						{$tag|escape:'html':'UTF-8'}{if !$smarty.foreach.tagsLoop.last}, {/if}
					{/foreach}
				</span>
			{/if}

			{if Configuration::get('PH_BLOG_DISPLAY_LIKES')}
				<span class="post-likes">
					<a href="#" data-guest="{$cookie->id_guest|intval}" data-post="{$post->id_simpleblog_post|intval}" class="simpleblog-like-button">
						<i class="icon icon-heart"></i> 
						<span>{$post->likes|intval}</span> {l s='likes'  mod='ph_simpleblog'}
					</a>
				</span>
			{/if}

			{if Configuration::get('PH_BLOG_DISPLAY_VIEWS')}
			<span class="post-views">
				<i class="icon icon-eye"></i> {$post->views|escape:'html':'UTF-8'} {l s='views'  mod='ph_simpleblog'}
			</span>
			{/if}

			{if $allow_comments eq true && Configuration::get('PH_BLOG_COMMENTS_SYSTEM') == 'native'}
			<span class="post-comments">
				<i class="icon icon-comments"></i> {$post->comments|escape:'html':'UTF-8'} {l s='comments'  mod='ph_simpleblog'}
			</span>
			{/if}
		</div><!-- .post-meta-info -->

		{if $post->featured_image}
		<div class="post-featured-image">
			
				<a title="{$post->title|escape:'html':'UTF-8'}" class="fancybox">
					<img src="{$post->featured_image|escape:'html':'UTF-8'}" alt="{$post->title|escape:'html':'UTF-8'}" class="img-responsive" itemprop="image"  />
				</a>
			
		</div><!-- .post-featured-image -->
		{/if}	
		
		<div class="post-content rte" itemprop="text">
			{$post->content}
		</div><!-- .post-content -->

		{if $post_type == 'gallery' && sizeof($post->gallery)}
		<h4 class="title_block"> {l s='Gallery'  mod='ph_simpleblog'} </h4>
		<div class="post-gallery row">
			{foreach $post->gallery as $image}
			<div class="col-xs-6 col-md-3">
			<a rel="post-gallery-{$post->id_simpleblog_post|intval}" class="fancybox" href="{$gallery_dir|escape:'html':'UTF-8'}{$image.image|escape:'html':'UTF-8'}.jpg" title="{l s='View full' mod='ph_simpleblog'}"><img src="{$gallery_dir|escape:'html':'UTF-8'}{$image.image|escape:'html':'UTF-8'}.jpg" class="img-responsive" /></a>
			</div>
			{/foreach}
		</div><!-- .post-gallery -->
		{elseif $post_type == 'video'}
		<div class="post-video" itemprop="video">
			{$post->video_code}
		</div><!-- .post-video -->
		{/if}

		{if Configuration::get('PH_BLOG_DISPLAY_RELATED') && $related_products}
			{include file="./related-products.tpl"}
		{/if}

		<div id="displayPrestaHomeBlogAfterPostContent">
			{hook h='displayPrestaHomeBlogAfterPostContent'}
		</div><!-- #displayPrestaHomeBlogAfterPostContent -->
		
		{* Native comments *}
		{if $allow_comments eq true && Configuration::get('PH_BLOG_COMMENTS_SYSTEM') == 'native'}
			{include file="./comments/layout.tpl"}
		{/if}

		{* Facebook comments *}
		{if $allow_comments eq true && Configuration::get('PH_BLOG_COMMENTS_SYSTEM') == 'facebook'}
			{include file="./comments/facebook.tpl"}
		{/if}

		{* Facebook comments *}
		{if $allow_comments eq true && Configuration::get('PH_BLOG_COMMENTS_SYSTEM') == 'disqus'}
			{include file="./comments/disqus.tpl"}
		{/if}
				
	</div><!-- .ph_simpleblog -->
</div><!-- schema -->

{if Configuration::get('PH_BLOG_FB_INIT')}
<script>
var lang_iso = '{$lang_iso}_{$lang_iso|@strtoupper}';
{literal}(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/"+lang_iso+"/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
{/literal}
</script>
{/if}
<script>
$(function() {
	$('body').addClass('simpleblog simpleblog-single');
});
</script>