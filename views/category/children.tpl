<li>
  <!--Title category and URL category-->
  <a href="{{ url }}">
    {{ title }}
  </a>
  
  {% if children %}
  <!--Subcategories-->
  <ul>
    {{ children }}
  </ul>
  {% endif %}
</li>