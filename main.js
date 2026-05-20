// ============================================
// 用户体验研究作品集 - 交互脚本
// ============================================

const projects = [
  {
    title: "全屋智能用户研究",
    description:
      "围绕“全屋智能如何找到独特品类价值”展开研究，通过用户访谈与生活方式分析，识别用户对智能家居的真实期待与体验落差。",
    tags: ["用户访谈", "需求洞察", "智能家居", "体验策略"],
    link: "",
  },
  {
    title: "生活方式与人居观念用户分层",
    description:
      "不以智能产品敏感度划分用户，而是从生活方式、人居观念、家庭结构与居住价值观等维度理解用户，形成更贴近真实场景的用户分层。",
    tags: ["用户画像", "用户分层", "生活方式研究", "场景分析"],
    link: "",
  },
  {
    title: "用户场景与需求洞察",
    description:
      "通过梳理典型生活场景与行为动机，提炼用户在家庭空间、智能体验、收纳、学习、家务等场景下的真实需求。",
    tags: ["场景洞察", "行为分析", "需求提炼", "研究报告"],
    link: "",
  },
];

const skills = [
  { name: "深度访谈" },
  { name: "用户画像" },
  { name: "需求洞察" },
  { name: "可用性测试" },
  { name: "问卷调研" },
  { name: "KANO 模型" },
  { name: "NPS 评估" },
  { name: "体验策略" },
  { name: "焦点小组" },
  { name: "卡片分类" },
  { name: "参与式设计" },
  { name: "VOC 分析" },
];

function renderProjects() {
  const grid = document.getElementById("projectsGrid");
  if (!grid) return;

  grid.innerHTML = projects
    .map((project) => {
      const tagsHtml = project.tags
        .map((tag) => `<span class="project-tag">${tag}</span>`)
        .join("");

      const linkHtml = project.link
        ? `<a href="${project.link}" target="_blank" rel="noopener">查看详情</a>`
        : "";

      return `
        <article class="project-card">
          <h3>${project.title}</h3>
          <p>${project.description}</p>
          <div class="project-tags">${tagsHtml}</div>
          <div class="project-links">${linkHtml}</div>
        </article>
      `;
    })
    .join("");
}

function renderSkills() {
  const grid = document.getElementById("skillsGrid");
  if (!grid) return;

  grid.innerHTML = skills
    .map(
      (skill) => `
        <div class="skill-item">
          <div>${skill.name}</div>
        </div>
      `
    )
    .join("");
}

function initThemeToggle() {
  const toggle = document.getElementById("themeToggle");
  if (!toggle) return;

  const storageKey = "site-theme";
  const savedTheme = localStorage.getItem(storageKey);
  const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
  const initialTheme = savedTheme || (prefersDark ? "dark" : "light");

  applyTheme(initialTheme);

  toggle.addEventListener("click", () => {
    const currentTheme = document.documentElement.getAttribute("data-theme");
    const nextTheme = currentTheme === "dark" ? "light" : "dark";
    applyTheme(nextTheme);
    localStorage.setItem(storageKey, nextTheme);
  });

  function applyTheme(theme) {
    document.documentElement.setAttribute("data-theme", theme);
    toggle.textContent = theme === "dark" ? "浅色" : "深色";
  }
}

function setFooterYear() {
  const yearElement = document.getElementById("year");
  if (yearElement) {
    yearElement.textContent = new Date().getFullYear();
  }
}

document.addEventListener("DOMContentLoaded", () => {
  renderProjects();
  renderSkills();
  initThemeToggle();
  setFooterYear();
});
