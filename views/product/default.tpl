{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'behavior.tabstate' | jhtml }}

{% comment %}
	Variable depending on the availability of the product:
    '0'  - Not in stock;
    '-1' - In stock;
    '-2' - To order;
    'X'  - Balance of stock.
{% endcomment %}
{% case stock %}
	{% when 0 %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_0' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = true %}
        {% assign btn_quickorder = false %}
	{% when '-1' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_1' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
	{% when '-2' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_2' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
	{% else %}
        {% assign stock_text = 'sprintf' | jtext: 'COM_JKASSA_STOCK_N', stock %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
{% endcase %}

{% comment %}
	In cart
{% endcomment %}
{% if cart_disabled %}
	{% assign btn_cartDisabled = true %}
    {% assign btn_cart = false %}
{% endif %}

{% if heading and quickview == 0 %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

<!--Product-->
<div class="items-row cols-2" itemscope itemtype="http://schema.org/Product">
  <!--Name-->
  <h2>
    <a itemprop="url" href="{{ url }}" target="_top">
      <span itemprop="name">{{ name }}</span>
    </a>
    {% if files %}
    <!--Files-->
    <span title="{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}: {{ files | join: ', ' }}">
      <img alt="info" src="media/system/images/new.png">
    </span>
    {% endif %}
  </h2>
  
  <!--Images-->
  <div class="column-1 product-image">
    {% assign jkmedia = images | jkmedia: 64, 380 %}
    {% if jkmedia %}
      {{ jkmedia }}
    {% else %}
    <img {{ image | img_exists: '260x380' }} alt="{{ alias }}">
    {% endif %}
    
    {% if stickers %}
    <!-- Stickers -->
    <ul class="stickers">
      {% if new %}
      <li>
        <span class="product-label product-label_new">NEW</span>
      </li>
      {% endif %}
      {% if hit %}
      <li>
        <span class="product-label product-label_hit">HIT</span>
      </li>
      {% endif %}
      {% if discount %}
      <li>
        {% assign options = 'decimals' | arrayCombine: 0 %}
        {% if discount_image %}
        <img {{ discount_image | img_exists: '30x30' }} alt="" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
        {% else %}
        <span class="product-label" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
          -{{ discount | costDisplay: options }}{% if d_symbol == '%' %}{{ d_symbol }}{% endif %}
        </span>
        {% endif %}
      </li>
      {% endif %}
    </ul>
    {% endif %}
    
    {% if tags %}
    <!-- Tags -->
    <div style="position: absolute; right: 0; top: 4px">
      {% for tag in tags %}
      <a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px; padding: 0 5px">
        {{ tag.title }}
      </a><br>
      {% endfor %}
    </div>
    {% endif %}
  </div>
  
  <!--Cost block-->
  <div class="column-2">
    
    {% if manufacturer %}
    <!--Manufacturer-->
    <div itemtype="http://schema.org/Brand" itemscope itemprop="brand">
      <a title="{{ manufacturer.name }}" href="{{ manufacturer.url }}" target="_top">
		<span style="display: none;" itemprop="name">{{ manufacturer.name }}</span>
        <img src="{{ manufacturer.logo }}" alt="{{ manufacturer.alias }}" style="max-height: 60px; max-width: 200px" itemprop="logo">
      </a>
    </div>
    {% endif %}
    
    {% comment %}
	    Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
    {% endcomment %}
	{% if reviews_included %}
	  <!--Rating reviews-->
	  <div id="jkReviewsRating" style="display: inline-block; line-height: 18px;">
	    {% include 'html/reviews/rating' %}
	  </div>
	{% else %}
      {% assign votes = id | jkvotes: rating, rating_count %}
      {% if votes %}
        <!--Voting-->
        <div>
          {{ votes }}
        </div>
      {% endif %}
	{% endif %}
    
    {% if present %}
    <!--Share (Product as a present)-->
    <div class="share">
      <div class="sharetitle">
        + {{ present.name }}
      </div>
      <div class="sharedesc">
        <a href="{{ present.url }}" target="_top">
          <img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
          <span>{{ present.desc }}</span>
        </a>
      </div>
    </div>
    {% endif %}
    
    <!--Cost-->
    <div class="cost" itemscope itemprop="offers" itemtype="http://schema.org/Offer">
      <meta content="{{ currency.code }}" itemprop="priceCurrency">
      <link href="http://schema.org/InStock" itemprop="availability">
      {% if old_cost %}
      <del>{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
      {% endif %}
	  {% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
      <span itemprop="price" content="{{ cost | costDisplay: options }}">{{ cost | costDisplay }}</span>{{ currency.symbol }}
	  {% if vat %}
	  <small>
		({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', vat }})
	  </small>
      {% endif %}
    </div>
    
    <!--SKU (code)-->
    <div class="text-right">
      {{ '_' | jtext: 'COM_JKASSA_SKU' }}:
      <small itemprop="mpn">
        {{ sku }}
      </small>
    </div>
    
    {% comment %}
        Variants product.
        See: html\forms\variants.tpl
    {% endcomment %}
    {% if variants %}
    <div>
      {{ variants }}
    </div>
    {% endif %}
    
    <!--Stock-->
    <p>
      {{ stock_text }}
    </p>
	
	{% if cart_disabled != 'false' %}
  	<!--Quantity-->
  	<div>
	  <a href="javascript:;" data-click="qty-minus" data-id="{{ id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
	  <input type="text" value="{{ limit }}" data-limit="{{ limit }}" data-maxlimit="{{ maxlimit }}" size="2" name="qty-product-{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}" class="text-center">
	  <a href="javascript:;" data-click="qty-plus" data-id="{{ id }}" class="button" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
  	</div>
  	{% endif %}
    
    <!--Buttons-->
    <p>
      {% if btn_buyDisabled %}
      <!--Buy disabled-->
      <span class="button">
        {{ '_' | jtext: 'COM_JKASSA_BUY' }}
      </span>
      {% endif %}
      
      {% if btn_buy %}
      <!--Buy-->
      <a href="#" data-click="to-order" data-id="{{ id }}" data-url="{{ form_url }}" class="button">
        {{ '_' | jtext: 'COM_JKASSA_BUY' }}
      </a>
      {% endif %}
      
      {% if btn_cartDisabled %}
      <!--Cart disabled-->
      <span class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_CART', name }}">
        {{ '_' | jtext: 'COM_JKASSA_IN_CART' }}
      </span>
      {% endif %}
      
      {% if btn_cart %}
      <!--Cart-->
      <a href="#" data-click="to-cart" data-id="{{ id }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', name }}">
        {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
      </a>
      {% endif %}
      
      {% if btn_report %}
      <!--Waiting List-->
      {{ 'behavior.modal' | jhtml: '#jk-modal_waitinglist' }}
      <a href="{{ waitinglist }}" class="button" id="jk-modal_waitinglist" rel="{handler: 'iframe', size: {x:768, y:430}}">
        {{ '_' | jtext: 'COM_JKASSA_WAITINGLIST' }}
      </a>
      {% endif %}
      
      <br><br>
      
      <!--Add to Wishlist-->
      <a href="#" data-click="to-wishlist" data-id="{{ id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', name }}">
        {{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}
      </a>
      &nbsp;
      <!--Add to compare-->
      <a href="#" data-click="to-compare" data-id="{{ id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', name}}">
        {{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}
      </a>
    </p>
    
    {% if btn_quickorder and quickorder %}
    <!--Quick order-->
    <p>
      {{ 'behavior.modal' | jhtml: '#jk-modal_quickorder' }}
      <a href="{{ quickorder }}" class="button" id="jk-modal_quickorder" rel="{handler: 'iframe', size: {x:768, y:430}}">
        {{ '_' | jtext: 'COM_JKASSA_QUICK_ORDER' }}
      </a>
    </p>
    {% endif %}
    
    {% if f_attributes %}
    <!--Featured attributes-->
    <ul>
      {% for attribute in f_attributes %}
      <li>
        {{ attribute.name }}:
        {{ attribute.value }}
        {% if attribute.tooltip %}
        <span title="{{ attribute.tooltip }}">
          <img alt="info" src="media/system/images/tooltip.png">
        </span>
        {% endif %}
      </li>
      {% endfor %}
    </ul>
    {% endif %}
    
    {% comment %}
        Connecting social plugin.
        See: Plugin Manager: Plugins -> jksocial.
    {% endcomment %}
    {% assign social = id | jksocial: name, image, metadesc, return_url %}
    {% if social %}
    {{ social }}
    {% endif %}
  </div>
  
  <!--Product Description (introtext)-->
  <span itemprop="description" style="display: none">
    {{ introtext | truncateDesc: 140 }}
  </span>
</div>

{% comment %}
    Connecting comments plugin (position: tabbed).
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{% assign com_tabbed = id | jkcomments: name, 'tabbed' %}

<!--Tabs-->
<div>
  <ul class="tabs" id="prodTab">
    <li class="active">
      <a href="#description" data-toggle="tab">
        {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
      </a>
    </li>
    {% if attributes %}
    <li>
      <a href="#attributes" data-toggle="tab">
        {{ '_' | jtext: 'COM_JKASSA_ATTRIBUTES' }}
      </a>
    </li>
    {% endif %}
    {% if tabs %}
    {% for tab in tabs %}
    <li>
      <a href="#{{ tab.id }}" data-toggle="tab">
        {{ tab.name }}
      </a>
    </li>
    {% endfor %}
    {% endif %}
	{% if reviews_included %}
	<li>
      <a href="#reviews" data-toggle="tab">
		{{ '_' | jtext: 'COM_JKASSA_REVIEWS' }} ({{ rating_count }})
	  </a>
    </li>
	{% endif %}
    {% if com_tabbed %}
    <li>
      <a href="#comments" data-toggle="tab">
        {{ '_' | jtext: 'COM_JKASSA_COMMENTS' }}
      </a>
    </li>
    {% endif %}
  </ul>
  <div class="tab-content">
    <!--Description-->
    <div class="tab-pane active" id="description">
      {{ fulltext }}
    </div>
    
    {% if attributes %}
    <!--Attributes-->
    <div class="tab-pane" id="attributes">
      <ul>
        {% for attribute in attributes %}
        <li>
          {{ attribute.name }}
          {{ attribute.value }}
          {% if attribute.tooltip %}
          <span title="{{ attribute.tooltip }}">
            <img alt="info" src="media/system/images/tooltip.png">
          </span>
          {% endif %}
        </li>
        {% endfor %}
      </ul>
    </div>
    {% endif %}
    
    {% if tabs %}
    {% for tab in tabs %}
    <div class="tab-pane" id="{{ tab.id }}">
      {{ tab.content }}
    </div>
    {% endfor %}
    {% endif %}
	
	{% if reviews_included %}
	<!--Reviews-->
	<div class="tab-pane" id="reviews">
	  {% include 'html/reviews/reviews' %}
	</div>
	{% endif %}
    
    {% if com_tabbed %}
    <!--Comments-->
    <div class="tab-pane" id="comments">
      {{ com_tabbed }}
    </div>
    {% endif %}
  </div>
</div>

{% if cheaper %}
<!--Share: Together cheaper-->
<div>
  <h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
  {% include 'html/products/cheaper' %}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin (position: bottom).
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{% assign com_bottom = id | jkcomments: name, 'bottom' %}
{% if com_bottom %}
  {{ com_bottom }}
{% endif %}

{% if quickview == 0 %}
  <!--Print / Email / Edit-->
  <ul class="actions">
    {% if print_screen == 0 %}
      <li class="print-icon">
        {{ print_icon }}
      </li>
      <li class="email-icon">
        {{ email_icon }}
      </li>
      {% if edit_icon %}
      <li class="edit-icon">
        {{ edit_icon }}
      </li>
      {% endif %}
    {% else %}
      <li class="print-icon" style="position: fixed; right: 10px; top: 10px">
        {{ print_screen }}
      </li>
    {% endif %}
  </ul>
  
  <!--Details-->
  <dl class="article-info">
    <dt class="article-info-term">Details</dt>
    <dd>
      {{ 'sprintf' | jtext: 'COM_JKASSA_WRITTEN_BY', '' }}
      {% if contact_link %}
      <a href="{{ contact_link }}">{{ author }}</a>
      {% else %}
      {{ author }}
      {% endif %}
    </dd>
    {% if parent_title %}
    <dd>
      {% capture parent %}<a href="{{ parent_url }}">{{ parent_title }}</a>{% endcapture %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_PARENT', parent }}
    </dd>
    {% endif %}
    <dd>
      {% capture category %}<a href="{{ category_url }}">{{ category_title }}</a>{% endcapture %}
      {{ 'sprintf' | jtext: 'COM_JKASSA_CATEGORY', category }}
    </dd>
    <dd>
      <time datetime="{{ 'date' | jhtml: publish, 'c' }}">
        {% assign date_publish = 'date' | jhtml: publish, 'DATE_FORMAT_LC2' %}
        {{ 'sprintf' | jtext: 'COM_JKASSA_PUBLISHED_DATE_ON', date_publish }}
      </time>
    </dd>
    <dd>
      <time datetime="{{ 'date' | jhtml: created, 'c' }}">
        {% assign date_created = 'date' | jhtml: created, 'DATE_FORMAT_LC2' %}
        {{ 'sprintf' | jtext: 'COM_JKASSA_CREATED_DATE_ON', date_created }}
      </time>
    </dd>
    <dd>
      <time datetime="{{ 'date' | jhtml: modified, 'c' }}">
        {% assign date_modified = 'date' | jhtml: modified, 'DATE_FORMAT_LC2' %}
        {{ 'sprintf' | jtext: 'COM_JKASSA_LAST_UPDATED', date_modified }}
      </time>
    </dd>
    <dd>
      {{ 'sprintf' | jtext: 'COM_JKASSA_PRODUCT_HITS', hits }}
    </dd>
  </dl>
  
  {% if pagination %}
  <!--Pagination-->
  <ul class="pager pagenav">
    {% if pagination.prev %}
    <li class="previous">
      <a href="{{ pagination.prev }}" rel="prev">
        {{ '_' | jtext: 'JPREV' }}
      </a>
    </li>
    {% endif %}
    {% if pagination.next %}
    <li class="next">
      <a href="{{ pagination.next }}" rel="next">
        {{ '_' | jtext: 'JNEXT' }}
      </a>
    </li>
    {% endif %}
  </ul>
  {% endif %}
{% endif %}