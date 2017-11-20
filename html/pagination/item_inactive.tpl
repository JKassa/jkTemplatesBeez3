{% case action %}
  {% when 'start' %}
    <span class="pagenav"><<</span>
  {% when 'previous' %}
    <span class="pagenav"><</span>
  {% when 'next' %}
    <span class="pagenav">></span>
  {% when 'end' %}
    <span class="pagenav">>></span>
  {% else %}
    <span class="pagenav">{{ text }}</span>
{% endcase %}