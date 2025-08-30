---
layout: page
permalink: /publications/
title: publications
description: publications in reversed chronological order.
nav: true
nav_order: 3
---

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-SKJYECJLHD"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-SKJYECJLHD');
</script>

<!-- _pages/publications.md -->

Most recent <a href="https://scholar.google.com/citations?user=BVpKCDwAAAAJ">list of papers</a> according to google scholar, preprints available in the list below.

<div class="publications">


{% bibliography -f {{ site.scholar.bibliography }} %}

</div>
