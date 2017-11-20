<ul style="margin-top: 1.5em;">
  {% if user_name %}
  <li>
    <strong>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}:</strong>
    {{ user_name }}
  </li>
  {% endif %}
  {% if user_email %}
  <li>
    <strong>{{ '_' | jtext: 'JGLOBAL_EMAIL' }}:</strong>
    {{ user_email }}
  </li>
  {% endif %}
  {% if user_data %}
    {% for user in user_data %}
    <li>
      <strong>{{ user.name }}</strong>: {{ user.value }}
    </li>
    {% endfor %}
  {% endif %}
  {% if custom_fields %}
    {% for field in custom_fields %}
    <li>
      <strong>{{ field.name }}</strong>: {{ field.value }}
    </li>
    {% endfor %}
  {% endif %}
</ul>