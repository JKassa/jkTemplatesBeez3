{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<h2>
  {{ '_' | jtext: 'COM_JKASSA_WAITINGLIST' }}
</h2>

<div class="items-row cols-2">
  <div class="column-1">
    <img {{ image | img_exists: '104x150' }} alt="{{ alias }}" />
    {% if present %}
    <!--Share (Product as a present)-->
    <div class="share" title="{{ present.desc }}">
      <div class="sharetitle">
        {{ '_' | jtext: 'COM_JKASSA_GIFT' }}
      </div>
      <div class="sharedesc">
        <a href="{{ present.url }}">
          <img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
        </a>
      </div>
    </div>
    {% endif %}
  </div>
  
  <div class="column-2">
    <h4>
      <a href="{{ url }}" target="_blank">
        {{ name }}
      </a>
      
      {% if files %}
      <!--Files-->
      <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ product.files | join: ', ' }}">
        <img alt="info" src="media/system/images/new.png">
      </span>
      {% endif %}
    </h4>
    
    <!--SKU (code)-->
    <small>
      {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
    </small>
    
    {% if variants %}
    <!--Product variants-->
    <div>
      {% for variant in variants %}
        {{ variant.name }}: {{ variant.text }}
      {% endfor %}
    </div>
    {% endif %}
    
    <!--Cost-->
    <div class="cost">
      <!--old cost-->
      {% if old_cost %}
      <del>{{ old_cost }}{{ currency.symbol }}</del>
      {% endif %}
      <!--cost-->
      <span>{{ cost }}</span>{{ currency.symbol }}
    </div>
  </div>
</div>

<form action="{{ form_action }}" method="post" id="waitingList">
  <fieldset>
    {% for field in fields %}
      {% case field.type %}
        {% when 'firstname' %}
          {% include 'html/forms/field_text' %}
        {% when 'email' %}
          {% include 'html/forms/field_email' %}
      {% endcase %}
    {% endfor %}
  </fieldset>
  <input type="submit" data-click="waitinglist-form" class="button" value="{{ '_' | jtext: 'JSUBMIT' }}">
</form>

<div id="waitingListAlert" style="display: none;">
  <h4>{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_1' }}</h4>
  <p>{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_2' }}</p>
</div>