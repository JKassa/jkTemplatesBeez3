<div{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
  <label for="{{ field.name }}">
    {{ field.label }}{% if field.required %} <span class="star text-error">*</span>{% endif %}
  </label>
  <span{% if field.tooltip %} title="{{ field.tooltip }}"{% endif %}>
    <select
    	name="{{ field.name }}"
        id="{{ field.name }}"
        {% if field.required %} required{% endif %}
        {% if field.readonly %} disabled{% endif %}
        {% if field.onchange %} onchange="{{ field.onchange }}"{% endif %}>
      {% for value in field.values %}
      <option value="{{ value }}"{% if field.default == value %} selected{% endif %}>{{ value }}</option>
      {% endfor %}
    </select>
  </span>
</div>