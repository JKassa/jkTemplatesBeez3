{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% if reviews %}
<div>
	{% for review in reviews %}
	<div>
		{% if show_avatar %}
		<span class="pull-left" style="margin-right: 10px;">
			<img src="{{ review.user_img }}" alt="{{ review.user_name }}" style="width: 44px; height: 44px;">
		</span>
		{% endif %}
		<div style="overflow: hidden;">
			<h4>
				{{ review.user_name }} - <a href="{{ review.product_url }}">{{ review.product_name }}</a>
				{% if show_date %}
				<small class="pull-right">
					{{ review.date }}
				</small>
				{% endif %}
			</h4>
			<div>
				<p>{{ review.review }}</p>
			</div>
		</div>
	</div>
	{% endfor %}
</div>
{% else %}
<!--No reviews yet-->
<strong>
	{{ '_' | jtext: 'MOD_JKASSA_REVIEWS_NO' }}
</strong>
{% endif %}