---
title: 'Antd-栅格化布局（Row,Col）实现原理）'
date: 2021-11-12 17:52:11
tags:
---

```css
/**
  * <Row gutter={[12, 12]}>
  *  <Col span={6}>
  *  </Col>
  * </Row>
  */
.row {
  display: flex;
  flex-flow: row wrap;
  row-gap: 12px; /** gutter[1]的值 */
  margin-left: -6px; /** (-gutter[0]/2)的值 */
  margin-right: -6px; /** (-gutter[0]/2)的值 */
}

.col {
  flex: 0 0 25%;
  max-width: 25%;
  padding: 0 6px; /** (gutter[0]/2)的值 */
}
```
