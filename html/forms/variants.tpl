<div class="product-variants" style="margin-bottom:1.5em">
  {% for variant in variants %}
  <div>
    <strong>
      {{ variant.name }}:
    </strong>
    <br>
    
    {% case variant.type %} 
      {% when 'select' %}
      <!--Drop-down list-->
      <select data-select="variant-select" name="variant-{{ product }}-{{ variant.id }}">
        {% for attribute in variant.attributes %}
        <option value="{{ attribute.value }}" data-attr-title="{{ attribute.title }}"{% if attribute.default %} selected{% endif %}>
          {{ attribute.value }}
        </option>
        {% endfor %}
      </select>
      
      {% when 'radio' %}
      <!--Group switches-->
      {% for attribute in variant.attributes %}
      <label class="radio">
        <input type="radio" data-checked="variant-radio" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
        {{ attribute.value }}
      </label>
      {% endfor %}
      
      {% when 'color' %}
      <!--Сolor switches-->
      {% for attribute in variant.attributes %}
      <label class="radio">
        <input type="radio" data-checked="variant-color" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
        {{ attribute.title }}
      </label>
      {% endfor %}
    {% endcase %}
    
    {% if variant.tooltip %}
    <!--Tooltip-->
    <span title="{{ variant.tooltip }}">
      <img alt="info" src="media/system/images/tooltip.png">
    </span>
    {% endif %}
  </div>
  {% endfor %}
  
  {% if user_variants %}
  <!--Reset variants-->
  <a href="#" data-click="variant-reset" data-id="{{ product }}" title="{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS_TITLE' }}">
    {{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS' }}
  </a>
  {% endif %}
</div>