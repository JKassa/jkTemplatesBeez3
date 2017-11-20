<a href="#" data-click="pages-links" data-return="{{ link }}" title="{{ text }}">
  {% case action %}
  {% when 'start' %}
  <<
  {% when 'previous' %}
  <
  {% when 'next' %}
  >
  {% when 'end' %}
  >>
  {% else %}
  {{ text }}
  {% endcase %}
</a>