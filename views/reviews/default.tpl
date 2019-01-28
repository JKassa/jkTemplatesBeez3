{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

{% if title %}
<!--Title-->
<h2>
	{{ title }}
	<small>({{ total }})</small>
</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

{% if reviews %}
<!--Filters-->
<form action="{{ form_action }}" method="post" name="reviewsForm" id="reviewsForm">
	<ul class="actions">
		<!--Sort by-->
		<li>
			{{ '_' | jtext: 'COM_JKASSA_SORT_TITLE' }}:
			<select onchange="this.form.submit()" name="filter_order">
				{% for sort in sorting %}
				<option value="{{ sort.value }}"{{ sort.selected }}>{{ sort.title }}</option>
				{% endfor %}
			</select>
		</li>
		<!--Limit-->
		<li>
			{{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}:
			<select onchange="this.form.submit()" name="limit" title="{{ '_' | jtext: 'JSHOW' }}" style="width: auto;">
				{% for limit in limits %}
				<option value="{{ limit.value }}"{{ limit.selected }}>{{ limit.title }}</option>
				{% endfor %}
			</select>
		</li>
	</ul>
</form>

<!--Reviews-->
<div>
	{% for review in reviews %}
	<div class="article-info">
		<div class="caption">
			<div class="pull-left" style="margin-right: 10px;">
				<a class="pull-left" href="{{ review.product_url }}" style="width: 64px;">
					<img alt="{{ review.product_alias }}" style="max-width: 64px; max-height: 64px;" src="{{ review.product_image }}">
				</a>
			</div>
			<div style="overflow: hidden;">
				<h4 style="margin-bottom: 10px;">
					<a href="{{ review.product_url }}">
						{{ review.product_name }}
					</a>
				</h4>
				<!--Rating reviews-->
				{% for i in (1..5) %}
					{% if review.product_rating >= i %}
						{{ 'image' | jhtml: 'system/rating_star.png', 'star', '', 1 }}
					{% else %}
						{{ 'image' | jhtml: 'system/rating_star_blank.png', 'star_blank', '', 1 }}
					{% endif %}
				{% endfor %}
				<br>
				<small>{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', review.product_rating_count }}</small>
			</div>
		</div>
		<hr>
		{% assign review_id     = review.id %}
		{% assign user_img      = review.user_img %}
		{% assign user_name     = review.user_name %}
		{% assign rating        = review.rating %}
		{% assign date     	    = review.date %}
		{% assign dignity       = review.dignity %}
		{% assign shortcomings  = review.shortcomings %}
		{% assign parent        = review.parent %}
		{% assign review_rating = review.review_rating %}
		{% assign children      = review.children %}
		{% assign product_id    = review.product_id %}
		{% assign review        = review.review %}
		{% include 'html/reviews/post' %}
	</div>
	{% endfor %}
</div>
{% else %}
<strong>
	{{ '_' | jtext: 'COM_JKASSA_REVIEWS_COUNT_0' }}
</strong>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% comment %}
	Pages links (pagination).
	See: html/pagination
{% endcomment %}
{{ pagesLinks }}