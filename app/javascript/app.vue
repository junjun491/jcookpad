<template>
  <div id="app"></div>
</template>

<script>

 export default {
-  router,
-};
+  data: function () {
+    return {
+      message: "Hello Vue!"
+    }
+  }
+}
</script>

-
<style></style>
+
<style scoped>
+p {
+  font-size: 2em;
+  text-align: center;
+}
+
</style>
