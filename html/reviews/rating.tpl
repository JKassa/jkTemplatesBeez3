{% for i in (1..5) %}
  {% if rating >= i %}
	{{ 'image' | jhtml: 'system/rating_star.png', 'vote-1', 'style="width: 16px"', 1 }}
  {% else %}
	{{ 'image' | jhtml: 'system/rating_star_blank.png', 'vote-1', 'style="width: 16px"', 1 }}
  {% endif %}
{% endfor %}

<span style="float: right; padding: 0 8px;">
	{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', rating_count }}
</span>