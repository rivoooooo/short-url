# four-ever-link-demo

一个部署在 Cloudflare Pages Functions（Workers 运行时）上的自托管短链服务，使用 Cloudflare KV 保存短链映射、D1 保存账号与统计数据。

## 致谢与项目来源

本项目基于 [4ev-link/4ev.link](https://github.com/4ev-link/4ev.link) 构建。感谢原作者公开其实现；本仓库保留原始 [CC0 1.0](LICENSE) 许可证与许可文本。

本仓库的改动包括：

- 增加 Wrangler 的 Pages、KV 与 D1 部署配置和 D1 初始化迁移；
- 改为使用当前部署域名显示短链；
- 移除原站专属的统计脚本、博客与邮箱链接；
- 移除 Turnstile 人机验证，便于个人演示环境使用。

> 去除人机验证会降低公开服务的滥用防护能力。若对外提供服务，建议自行增加限流、验证码或其他防护措施。

## 部署

1. 使用 `wrangler` 登录 Cloudflare。
2. 在 `wrangler.jsonc` 中配置或创建 `KV_EV` 与 `D1_EV` 绑定。
3. 执行数据库迁移：

   ```sh
   wrangler d1 execute four-ever-link-demo --remote --file migrations/0001_initial.sql
   ```

4. 部署：

   ```sh
   wrangler pages deploy . --project-name four-ever-link-demo
   ```

管理员管理页使用 Pages 加密环境变量 `ADMIN_PASS`。
