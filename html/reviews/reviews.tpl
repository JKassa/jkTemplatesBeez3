{% if reviews_access %}
<div class="alert alert-block">
  {{ '_' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_VIEW' }}
</div>
{% else %}

<!--Reviews-->
<div id="jkReviews">
  {% if reviews %}
    {{ reviews }}
  {% else %}
    <p id="noPosts">
      {{ '_' | jtext: 'COM_JKASSA_REVIEWS_NO' }}
    </p>
  {% endif %}
</div>

{% if reviews_more %}
  <div class="text-center m-t-30">
	<a href="#" class="button" data-click="more-reviews" data-id="{{ id }}" data-limitstart="0">
	  {{ '_' | jtext: 'COM_JKASSA_MORE' }}
	</a>
  </div>
{% endif %}

<!--Form-->
{% if reviews_access_form %}
<p>
  {{ '_' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_POST' }}
</p>
{% else %}
<div>
  {% include 'html/reviews/form' %}
</div>
{% endif %}
{% endif %}