{% for category in categories %}
  {% capture title_slide %}{{ category.title }}{% if category.qty_products %} <small><em>({{ category.qty_products }})</em></small>{% endif %}{% endcapture %}
  {% capture collapseId %}collapseSlider-{{ category.id }}{% endcapture %}
  {% if category.active %}
    {% assign active = ' in' %}
  {% endif %}
  
  {{ 'sliders.panel' | jhtml: title_slide, collapseId }}
    
    <div style="padding: 10px 0;">
      {% if category.image %}
      <a href="{{ category.url }}">
        <img src="{{ category.image }}" alt="{{ category.alias }}" style="display: block; max-height: 50px; max-width: 50px;" />
      </a>
      {% endif %}
      {% if category.description %}
      <p style="font-size: 10px; line-height: 10px;">
        {{ category.description | truncateDesc: 100 }}
      </p>
      {% endif %}
      <div style="clear: both;"></div>
      <p class="readmore" style="text-align: right;">
        <a href="{{ category.url }}" class="btn btn-mini" data-placement="left" title="{{ 'sprintf' | jtext: 'MOD_JKASSA_CATEGORIES_GO_TITLE', category.title }}">
          <span class="icon-arrow-right"></span>
          {{ '_' | jtext: 'MOD_JKASSA_CATEGORIES_GO' }}
        </a>
      </p>
    
      {% assign startTemp = start %}
      
      {% if category.children %}
        {% increment start %}
        {% capture selector %}mjkcategories-accordion-{{ start }}{% endcapture %}
        {% assign params = 'startOffset' | arrayCombine: 100 %}
        {{ 'sliders.start' | jhtml: selector, params }}
          {% assign assigns = 'categories,start' | arrayCombine: category.children, start %}
          {{ assigns | layoutRender: 'modules/categories', 'accordion' }}
        {{ 'sliders.end' | jhtml }}
      {% endif %}
      
      {% assign start = startTemp %}
    </div>
    
{% endfor %}